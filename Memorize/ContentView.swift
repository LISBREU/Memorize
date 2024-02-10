//
//  ContentView.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 09.02.2024.
//

import SwiftUI

struct ContentView: View {
    let myTitle = Text("Memorize!").font(.largeTitle)
        .foregroundStyle(Color.pink)
    let emojis: [String] = ["👻", "🎃", "🕷️", "👹", "☠️", "🧙‍♂️", "🦸‍♀️", "🍭", "🕸️", "🧟‍♂️", "💀", "🏴‍☠️", "😈"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            myTitle
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.pink)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > 12 )
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus.rectangle.portrait")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "plus.rectangle.portrait")
        
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                        base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        } .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
