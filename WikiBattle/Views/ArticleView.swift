//
//  ArticleView.swift
//  WikiBattle
//


import SwiftUI

struct ArticleView: View {
    
    let article: WikiArticle.WikiPage
    let isCorrectLength: Bool
    let isCorrectBrowse: Bool
    
    @Binding var isCheckingAnswer: Bool
    @Binding var isCorrect: Bool
    @Binding var isShowSafari: Bool
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                
                HStack {
                    // タイトルは1行にするために，長かったら横にスクロールできるようにする
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(article.title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    if (isCheckingAnswer) {
                        Button("記事を見る") {
                            isShowSafari = true
                        }
                    }
                }
                
                Divider()
                Text(article.formattedExtract.count > 100
                     ? String(article.formattedExtract.prefix(100)) + "..." :article.formattedExtract
                )
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
                        isCorrect = self.isCorrectLength
                        isCheckingAnswer = true
                    }
                    
                    ButtonView(buttonType: .browse) {
                        isCorrect = self.isCorrectBrowse
                        isCheckingAnswer = true
                    }
                }
                
            }
        }
        .padding()
        .frame(height: 240)
        .background(Color(.secondarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .sheet(isPresented: $isShowSafari) {
            SafariView(url: article.url)
                .ignoresSafeArea(edges: [.bottom])
        }
    }
}

#Preview {
    @Previewable @State var isCheckingAnswer = true
    @Previewable @State var isCorrect: Bool = true
    @Previewable @State var isShowSafari: Bool = false
    
    ArticleView(article: WikiArticle.WikiPage(pageid: 1, title: "記事1記事1記事1記事1記事1記事1記事1記事1記事1記事1", extract: "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト", pageviews: ["a": 1, "b": 2, "c": nil]),
                isCorrectLength: false, isCorrectBrowse: true, isCheckingAnswer: $isCheckingAnswer, isCorrect: $isCorrect, isShowSafari: $isShowSafari)
}
