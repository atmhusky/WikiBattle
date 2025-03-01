//
//  WikiArticleJson.swift
//  WikiBattle
//  


import Foundation

struct WikiArticleJson: Codable {
    let query: Pages
    
    struct Pages: Codable {
        let pages: [String: WikiPage]
    }
                        
    struct WikiPage: Codable {
        let pageid: Int
        let title: String
        let extract: String
        let pageviews: [String: Int?]
    }
}
