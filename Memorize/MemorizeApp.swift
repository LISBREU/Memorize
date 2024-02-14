//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ilnur Shabanov on 09.02.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
