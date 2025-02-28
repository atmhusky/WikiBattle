//
//  ContentView.swift
//  WikiBattle
//


import SwiftUI

struct ContentView: View {
    
    let upperArticle = WikiArticle(id: "1", title: "記事1", text: "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト", browseCount: 1000)
    let underArticle = WikiArticle(id: "2", title: "記事2", text: "テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト", browseCount: 2000)
    
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
                isCorrectLength: quiz.upperArticle.id == quiz.correctLengthArcicleId,
                isCorrectBrowse: quiz.upperArticle.id == quiz.correctBrowseArcicleId,
                isCheckingAnswer: isCheckingAnswer
            )
            
            // 2つ目の記事
            ArticleView(
                article: quiz.underArticle,
                isCorrectLength: quiz.underArticle.id == quiz.correctLengthArcicleId,
                isCorrectBrowse: quiz.underArticle.id == quiz.correctBrowseArcicleId,
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
