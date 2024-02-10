//
//  ContentView.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 09.02.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻", "🎃", "🕷️", "👹", "👹"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                        base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        } .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
 






#Preview {
    ContentView()
}
