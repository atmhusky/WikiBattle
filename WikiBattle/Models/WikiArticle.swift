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
            let result = regex?.stringByReplacingMatches(in: withoutNewlines, options: [], range: range, withTemplate: "")
            let formattedText = result?.trimmingCharacters(in: .whitespacesAndNewlines) ?? withoutNewlines
            
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
        
    }
}
