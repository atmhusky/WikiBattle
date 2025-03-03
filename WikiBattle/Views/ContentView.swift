//
//  ContentView.swift
//  WikiBattle
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quizViewModel = QuizViewModel()
    
    @State var isCheckingAnswer = false
    
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
            
            
            if let quiz = quizViewModel.quiz {
                // 1つ目の記事
                ArticleView(
                    article: quiz.upperArticle,
                    isCorrectLength: quiz.upperArticle.pageid == quiz.correctLengthArcicleId,
                    isCorrectBrowse: quiz.upperArticle.pageid == quiz.correctBrowseArcicleId,
                    isCheckingAnswer: $isCheckingAnswer
                )
                
                // 2つ目の記事
                ArticleView(
                    article: quiz.underArticle,
                    isCorrectLength: quiz.underArticle.pageid == quiz.correctLengthArcicleId,
                    isCorrectBrowse: quiz.underArticle.pageid == quiz.correctBrowseArcicleId,
                    isCheckingAnswer: $isCheckingAnswer
                )
            } else {
                progress
                progress
            }
            
            
            // 次の問題を出題するボタン
            ButtonView(buttonType: .next) {
                isCheckingAnswer = false
                Task {
                    await quizViewModel.createQuiz()
                }
            }
            .opacity(isCheckingAnswer ? 1 : 0)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    
    private var progress: some View {
        ProgressView()
            .padding()
            .frame(maxWidth: .infinity ,maxHeight: 240)
            .background(Color(.secondarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
}
