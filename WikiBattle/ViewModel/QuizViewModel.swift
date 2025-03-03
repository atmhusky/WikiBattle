//
//  QuizViewModel.swift
//  WikiBattle
//  


import Foundation

class QuizViewModel: ObservableObject {
    
    private var ids: [Int] = []  // 取得した記事のID
    @Published var quiz: Quiz?
    
    init() {
        Task {
            await createQuiz()
        }
    }
    
    // ランダムで記事を2つ取得し，Quizを生成する
    @MainActor
    func createQuiz() async {
        quiz = nil
        while true {
            do {
                ids = try await fetchRandomId()
                var articles: [WikiArticle.WikiPage] = []
                
                for id in ids {
                    let article = try await fetchArticle(pageId: id)
                    articles.append(article)
                }
                
                if isValidQuiz(articles) {
                    quiz = Quiz(upperArticle: articles[0], underArticle: articles[1])
                    break
                } else {
                    print("クイズとして不適切なので再生成")
                }
            } catch {
                print("Quizの作成エラー: \(error)")
                break
            }
        }
    }
    
    // クイズが問題として適切かどうかを判定
    private func isValidQuiz(_ articles: [WikiArticle.WikiPage]) -> Bool {
        
        let article1 = articles[0]
        let article2 = articles[1]
        
        // 文字数・閲覧数が一致している場合は答えが2超過になるため不適切
        // 文字数が100以下の場合は全文表示できてしまうので不適切
        return article1.browseCount != article2.browseCount &&
               article1.textLength != article2.textLength &&
               article1.textLength > 100 &&
               article2.textLength > 100
    }
    
    // MediaWiki APIを用いてランダムに2つ記事を識別するIDを取得する
    private func fetchRandomId() async throws -> [Int] {
        let urlString = "https://ja.wikipedia.org/w/api.php?action=query&format=json&list=random&rnnamespace=0&rnlimit=2"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let response = try decoder.decode(WikiId.self, from: data)
            
            let ids = response.query.random.map { $0.id }
            
            return ids
        } catch {
            print("記事IDの取得に失敗：\(error)")
            throw error
        }
    }
    
    // MediaWiki APIを用いて記事の詳細情報を取得する
    private func fetchArticle(pageId: Int) async throws -> WikiArticle.WikiPage {
        let urlString = "https://ja.wikipedia.org/w/api.php?action=query&format=json&prop=extracts|pageviews&explaintext=true"
        guard var url = URL(string: urlString) else { throw URLError(.badURL) }
        url.append(queryItems: [.init(name: "pageids", value: String(pageId))])

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(WikiArticle.self, from: data)

            if let page = response.query.pages[String(pageId)] {
                return page
            } else {
                throw NSError(domain: "QuizViewModel", code: 0, userInfo: [NSLocalizedDescriptionKey: "記事が見つかりません"])
            }
        } catch {
            print("記事の取得に失敗: \(error)")
            throw error
        }
    }
}
