//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 13.02.2024.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "👹", "🕸️", "🧟‍♂️", "😈", "👽"]
    
    @Published private var model = createMemoryGame()
    
    private static func createMemoryGame () -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⛔️"
            }
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
