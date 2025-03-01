//
//  QuizViewModel.swift
//  WikiBattle
//  


import Foundation

class QuizViewModel {
    
    private var ids: [Int] = []  // 取得した記事のID
    
    init() {
        Task {
            ids = try await fetchRandomId()  // fetchの動作確認用
            let page = try await fetchArticle(pageId: ids[0]) // fetchの動作確認用
        }
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
            let titles = response.query.random.map { $0.title }  // 表示確認用
            
            print(ids)  // 表示確認用
            print(titles)  // 表示確認用
            
            return ids
        } catch {
            print("記事IDの取得に失敗：\(error)")
            throw error
        }
    }
    
    private func fetchArticle(pageId: Int) async throws -> WikiArticleJson.WikiPage {
        let urlString = "https://ja.wikipedia.org/w/api.php?action=query&format=json&prop=extracts|pageviews&explaintext=true"
        guard var url = URL(string: urlString) else { throw URLError(.badURL) }
        url.append(queryItems: [.init(name: "pageids", value: String(pageId))])


        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(WikiArticleJson.self, from: data)

            if let page = response.query.pages[String(pageId)] {
                print(page)  // 表示確認用
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
