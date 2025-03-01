//
//  WikiId.swift
//  WikiBattle
//  


import Foundation

struct WikiId: Codable {
    
    let query: RandomData

    struct RandomData: Codable {
        let random: [ArticleId]
    }

    struct ArticleId: Codable {
        let id: Int
        let title: String
    }
}
