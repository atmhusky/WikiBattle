//
//  ArticleView.swift
//  WikiBattle
//  


import SwiftUI

struct ArticleView: View {
    
    let article: WikiArticle
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(article.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("記事を見る")
                        .foregroundStyle(.link)
                        .hidden()
                }
                
                Divider()
                Text(article.text)
            }
            
            HStack(spacing: 20) {
                Text("長い")
                    .fontWeight(.bold)
                    .frame(width:150, height: 40)
                    .background(.teal)
                    .clipShape(Capsule())
                
                Text("閲覧数が多い")
                    .fontWeight(.bold)
                    .frame(width:150, height: 40)
                    .background(.green)
                    .clipShape(Capsule())
                
            }
        }
        .padding()
        .frame(height: 240)
        .background(Color(.secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ArticleView(article: WikiArticle(id: "1", title: "記事1", text: "サンプルテキスト", browseCount: 1000))
}
