//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 13.02.2024.
//

import Foundation

struct MemoryGame <CardContent>{
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
