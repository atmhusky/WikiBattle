//
//  WikiArticleJson.swift
//  WikiBattle
//

import Foundation

struct WikiArticle: Codable {
    let query: Pages
    
    struct Pages: Codable {
        let pages: [String: WikiPage]
    }
                        
    struct WikiPage: Codable {
        let pageid: Int
        let title: String
        let extract: String
        let pageviews: [String: Int?]
        
        // extractに含まれるノイズを削除した本文
        var formattedExtract: String {
            // エスケープシーケンスの削除
            let withoutNewlines = self.extract.replacingOccurrences(of: "\n", with: " ")
            
            // 見出しの削除
            let regexPattern = "(={2,3}\\s*[^=]+\\s*={2,3})"
            let regex = try? NSRegularExpression(pattern: regexPattern, options: [])
            let range = NSRange(location: 0, length: withoutNewlines.utf16.count)
            let result = regex?.stringByReplacingMatches(in: withoutNewlines, options: [], range: range, withTemplate: "") ?? withoutNewlines
            
            // 余計な空白を削除
            let cleanedText = result.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
            
            let formattedText = cleanedText.trimmingCharacters(in: .whitespacesAndNewlines)
            return formattedText
        }

        // 本文の長さ
        var textLength: Int {
            self.formattedExtract.count
        }
        
        // pageviewsの合計値
        var browseCount: Int {
            self.pageviews.values.compactMap { $0 ?? 0 }.reduce(0, +)
        }
        
        // 記事のURL
        var url: URL {
            var url = URL(string: "http://ja.m.wikipedia.org/w/index.php")!
            url.append(queryItems: [.init(name: "curid", value: String(self.pageid))])
            
            return url
        }
        
    }
}
