//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Winson Chow on 6/3/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
