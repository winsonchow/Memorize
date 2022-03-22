//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Winson Chow on 9/3/22.
//
// This is the ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚂", "🚀", "🚁", "🚜", "🚲", "🚗", "🚌", "🚐", "🛴", "🚝", "🛳", "🛸", "🚒", "🚙", "🏍", "🛰", "⛵️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
