//
//  QuizViewModel.swift
//  WikiBattle
//  


import Foundation

class QuizViewModel {
    
    private var ids: [Int] = []  // 取得した記事のID
    
    init() {
        fetchRandomId()  // fetchの動作確認用
    }
    
    // MediaWiki APIを用いてランダムに2つ記事を識別するIDを取得する
    private func fetchRandomId() {
        let urlString = "https://ja.wikipedia.org/w/api.php?action=query&format=json&list=random&rnnamespace=0&rnlimit=2"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
 
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(WikiId.self, from: data)
                self.ids = response.query.random.map { $0.id }
                
                let titles = response.query.random.map { $0.title }  // 表示確認用
                
                print(self.ids)  // 表示確認用
                print(titles)  // 表示確認用
                
            } catch {
                print("記事IDの取得に失敗：\(error)")
            }
 
        }.resume()
    }
}
