//
//  MemoryGame.swift
//  Memorize
//
//  Created by Winson Chow on 9/3/22.
//
// This is the Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        // To get the index of the one and only face up card, we take the card indices and filter them,
        // looking for the cards that are face up, and return the one and only
        get { cards.indices.filter ({ cards[$0].isFaceUp }).oneAndOnly }
        
        // To set the index of the one and only face up card, we take the cards indices and for each of
        // them, we set the card is face up value equal to whether the thing we passed in equals that index
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        // We are going to look through our cards to find the first index where
        // that card's id equals our card's id
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
                                                       !cards[chosenIndex].isFaceUp,
                                                       !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        print("\(card)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    // This Card is actually MemoryGame.Card
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        
        // Never changes
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
