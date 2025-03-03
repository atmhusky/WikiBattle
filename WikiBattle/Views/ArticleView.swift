//
//  ArticleView.swift
//  WikiBattle
//  


import SwiftUI

struct ArticleView: View {
    
    let article: WikiArticle.WikiPage
    let isCorrectLength: Bool
    let isCorrectBrowse: Bool
    var isCheckingAnswer: Bool = false
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(article.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    if (isCheckingAnswer) {
                        Text("記事を見る")
                            .foregroundStyle(.link)
                    }
                }
                
                Divider()
                Text(article.formattedExtract)
            }
            
            HStack(spacing: 20) {
                if (isCheckingAnswer) {
                    Text("\(article.textLength)文字")
                        .fontWeight(.bold)
                        .frame(width:150, height: 40)
                        .background(isCorrectLength ? .teal : Color(.tertiaryLabel))
                        .clipShape(Capsule())
                    
                    Text("\(article.browseCount)回")
                        .fontWeight(.bold)
                        .frame(width:150, height: 40)
                        .background(isCorrectBrowse ? .green : Color(.tertiaryLabel))
                        .clipShape(Capsule())
                } else {
                    ButtonView(buttonType: .length) {
                        print("Length Pushed")
                    }
                    
                    ButtonView(buttonType: .browse) {
                        print("Browse Pushed")
                    }
                }
                
            }
        }
        .padding()
        .frame(height: 240)
        .background(Color(.secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ArticleView(article: WikiArticle.WikiPage(pageid: 1, title: "記事1", extract: "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト", pageviews: ["a": 1, "b": 2, "c": nil]),
                isCorrectLength: false, isCorrectBrowse: true, isCheckingAnswer: false)
}
