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
    let emojisHallowene: [String] = ["👻", "🎃", "🕷️", "👹", "👻", "🕷️", "🕸️", "👹", "🕸️", "🧟‍♂️", "🎃", "🧟‍♂️", "😈", "😈"]
    let emojisSport: [String] = ["⚽️", "🏀", "⚽️", "🏓", "🏒", "🏆", "🏐", "🏐", "🏀", "🏒", "🏓", "🏆"]
    let emojisFlags: [String] = ["🇯🇵", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇷🇺", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇦🇷", "🇯🇵", "🇷🇺", "🇦🇷", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿"]
    @State var selectedEmojis: [String] = []
    init() {
        self._selectedEmojis = State(initialValue: emojisHallowene)
    }
    @State var cardCount: Int = 0
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
                CardView(content: selectedEmojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.pink)
    }
    
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            haloweeneSelect
            Spacer()
            sportSelect
            Spacer()
            flagSelect
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    var haloweeneSelect: some View { 
        VStack{
            selectEmoji(contents: emojisHallowene, label: "13.circle.fill")
            Text("Scary").font(.title3)
        }
    }
    
    var sportSelect: some View {
        VStack{
            selectEmoji(contents: emojisSport, label: "figure.run.circle.fill")
            Text("Sport").font(.title3)
        }
    }
    
    var flagSelect: some View {
        VStack{
            selectEmoji(contents: emojisFlags, label: "flag.circle.fill")
            Text("Flags").font(.title3)
        }
    }
    
    func selectEmoji(contents: [String], label: String) -> some View {
        Button(action: {
            selectedEmojis.removeAll()
            selectedEmojis.append(contentsOf: contents)
            if cardCount == 0 {cardCount += 4}
        }, label: {
            Image(systemName: label)
        })
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
