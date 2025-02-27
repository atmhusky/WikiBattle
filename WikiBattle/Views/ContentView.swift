//
//  ContentView.swift
//  WikiBattle
//  


import SwiftUI

struct ContentView: View {
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
            VStack {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("記事のタイトル")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("記事を見る")
                            .foregroundStyle(.link)
                            .hidden()
                    }
                    
                    Divider()
                Text("記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．")
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
            
            // 2つ目の記事
            VStack {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("記事のタイトル")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Spacer()
                         
                        // 答えを表示した後に記事を見れるようにリンクを貼る
                        Text("記事を見る")
                            .foregroundStyle(.link)
//                            .hidden()
                    }
                    
                    Divider()
                Text("記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．記事の本文テキスト．")
                }
                
                HStack(spacing: 20) {
                    Text("12000文字")
                        .fontWeight(.bold)
                        .frame(width:150, height: 40)
                        .background(Color(.tertiaryLabel)) // 不正解のものは薄くする
                        .clipShape(Capsule())
                    
                    Text("4000回")
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
