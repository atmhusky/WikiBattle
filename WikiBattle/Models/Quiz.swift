//
//  Quiz.swift
//  WikiBattle
//  


import Foundation

struct Quiz {
    let upperArticle: WikiArticle.WikiPage
    let underArticle: WikiArticle.WikiPage
    
    var correctLengthArcicleId: Int {
        self.upperArticle.textLength > self.underArticle.textLength ? self.upperArticle.pageid : self.underArticle.pageid
    }
    
    var correctBrowseArcicleId: Int {
        self.upperArticle.browseCount > self.underArticle.browseCount ? self.upperArticle.pageid : self.underArticle.pageid
    }
}
