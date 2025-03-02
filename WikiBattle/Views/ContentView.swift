//
//  ContentView.swift
//  WikiBattle
//


import SwiftUI

struct ContentView: View {
    
    let quizViewModel = QuizViewModel()
    
    let upperArticle = WikiArticle.WikiPage(pageid: 1, title: "記事1", extract: "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト", pageviews: ["a": 1, "b": 2, "c": nil])
    let underArticle = WikiArticle.WikiPage(pageid: 2, title: "記事2", extract: "サンプルテキストサンプルテキストサンプルテキスト\nサンプルテキストサンプルテキスト== hoge ==サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト", pageviews: ["a": 4, "b": 10, "c": 9])
    
    var quiz: Quiz {
        Quiz(upperArticle: upperArticle, underArticle: underArticle)
    }
    
    @State var isCheckingAnswer = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("WikiButtle")
                .font(.title)
                .fontWeight(.bold)
            
            Text("どちらの記事が")
                .padding(.bottom, -10.0)
            
            Text("「長い？」 or 「閲覧数が多い？」")
                .font(.title2)
            
            Text("正解")
                .foregroundStyle(.green)
                .font(.title2)
                .opacity(isCheckingAnswer ? 1 : 0)
            
            // 1つ目の記事
            ArticleView(
                article: quiz.upperArticle,
                isCorrectLength: quiz.upperArticle.pageid == quiz.correctLengthArcicleId,
                isCorrectBrowse: quiz.upperArticle.pageid == quiz.correctBrowseArcicleId,
                isCheckingAnswer: isCheckingAnswer
            )
            
            // 2つ目の記事
            ArticleView(
                article: quiz.underArticle,
                isCorrectLength: quiz.underArticle.pageid == quiz.correctLengthArcicleId,
                isCorrectBrowse: quiz.underArticle.pageid == quiz.correctBrowseArcicleId,
                isCheckingAnswer: isCheckingAnswer
            )
            
            
            // 次の問題を出題するボタン
            ButtonView(buttonType: .next) {
                print("Next Pushed")
            }
            .opacity(isCheckingAnswer ? 1 : 0)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
