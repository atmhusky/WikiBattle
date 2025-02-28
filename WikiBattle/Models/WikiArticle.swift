//
//  WikiArticle.swift
//  WikiBattle
//

import Foundation

struct WikiArticle {
    let id: String  // 記事のID
    let title: String  // 記事のタイトル
    let text: String  // 記事の本文
    
    // 記事の長さ
    var textLength: Int {
        self.text.count
    }
    
    let browseCount: Int  // 過去60日間の記事の閲覧数(viewという名前は意図的に避けた)
    
    // 記事のURL
    var url: URL {
        var url = URL(string: "http://ja.wikipedia.org/w/index.php")!
        url.append(queryItems: [.init(name: "curid", value: self.id)])
        
        return url
    }
}
