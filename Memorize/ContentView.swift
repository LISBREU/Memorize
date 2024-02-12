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
    
    let emojisScary: [String] = ["👻", "🎃", "🕷️", "👹", "👻", "🕷️", "🕸️", "👹", "🕸️", "🧟‍♂️", "🎃", "🧟‍♂️", "😈", "😈"]
    let emojisSport: [String] = ["⚽️", "🏀", "⚽️", "🏓", "🏒", "🏆", "🏐", "🏐", "🏀", "🏒", "🏓", "🏆"]
    let emojisFlags: [String] = ["🇯🇵", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🇷🇺", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇦🇷", "🇯🇵", "🇷🇺", "🇦🇷", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿"]
    @State var selectedEmojis: [String] = []
    
    var body: some View {
        VStack {
            myTitle
            ScrollView{
                cards
            }
            Spacer()
            selectTheme
        }
        .padding()
    }
    
    func selectColor(mas: [String]) -> Color {
        if mas == emojisFlags {
            return .red
        } else if mas == emojisSport {
            return .blue
        } else {
            return .orange
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]){
            ForEach(0..<selectedEmojis.endIndex, id: \.self) { index in
                CardView(content: selectedEmojis.randomElement() ?? selectedEmojis[index])
                    .aspectRatio(2/3, contentMode: .fill)
            }
        }
        .foregroundColor(selectColor(mas: selectedEmojis))
    }
    
    
    var selectTheme: some View {
        HStack{
            haloweeneSelect
            Spacer()
            sportSelect
            Spacer()
            flagSelect
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    var haloweeneSelect: some View { 
        VStack{
            selectEmoji(contents: emojisScary, label: "13.circle.fill")
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
        }, label: {
            Image(systemName: label)
        })
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
