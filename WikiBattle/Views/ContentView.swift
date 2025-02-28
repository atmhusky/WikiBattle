//
//  ContentView.swift
//  WikiBattle
//  


import SwiftUI

struct ContentView: View {
    
    let upperArticle = WikiArticle(id: "1", title: "記事1", text: "サンプルテキスト", browseCount: 1000)
    let underArticle = WikiArticle(id: "2", title: "記事2", text: "テキスト", browseCount: 2000)
    
    var quiz: Quiz {
        Quiz(upperArticle: upperArticle, underArticle: underArticle)
    }
        
    
    var body: some View {
        VStack(spacing: 20) {
            Text("WikiButtle")
                .font(.title)
                .fontWeight(.bold)
            
            Text("どちらの記事が")
                .padding(.bottom, -10.0)
            Text("「長い？」 or 「閲覧数が多い？」")
                .font(.title2)
            
            Spacer()
            
            // 1つ目の記事
            ArticleView(article: quiz.upperArticle)
            
            // 2つ目の記事
            ArticleView(article: quiz.underArticle)
        
            
            Spacer()
            // テキスト
            Text("次の問題へ")
                .fontWeight(.bold)
                .frame(width: 300, height: 50)
                .background(.red)
                .clipShape(Capsule())
//                .hidden()

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
