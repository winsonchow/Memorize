//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Winson Chow on 9/3/22.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚂", "🚀", "🚁", "🚜", "🚲", "🚗", "🚌", "🚐", "🛴", "🚝", "🛳", "🛸", "🚒", "🚙", "🏍", "🛰", "⛵️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
//    // private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { index in "😀" })
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
//        emojis[pairIndex] // EmojiMemoryGame.emojis[pairIndex]
//    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
