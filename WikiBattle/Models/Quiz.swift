//
//  Quiz.swift
//  WikiBattle
//  


import Foundation

struct Quiz {
    let upperArticle: WikiArticle
    let underArticle: WikiArticle
    
    var correctLengthArcicleId: String {
        self.upperArticle.textLength > self.underArticle.textLength ? self.upperArticle.id : self.underArticle.id
    }
    
    var correctBrowseArcicleId: String {
        self.upperArticle.browseCount > self.underArticle.browseCount ? self.upperArticle.id : self.underArticle.id
    }
}
