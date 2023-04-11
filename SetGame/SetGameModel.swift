//
//  SetGameModel.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import Foundation

struct SetGameModel<CardContent> {
    var cards: Array<Card>
    var dealtCardsIndex: Int = 0
    var dealtCards: Array<Card> {
    get { Array(cards[0...dealtCardsIndex]) }
        
    }
    
    init(createCardContent: (Int) -> CardContent) {
        cards = []
        
        for num in 0..<81 {
            cards.append(Card(content: createCardContent(num), id: num))
        }
        
        cards.shuffle()
        
        dealtCardsIndex = 0
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func deal3MoreCards() {
        if dealtCardsIndex + 3 > 80{
            dealtCardsIndex = 80
        } else {
            dealtCardsIndex += 3
        }
    }
    
    struct Card: Identifiable {
        var isSelected = false // need to change this to something more ephemeral friendly apparently??
        var isMatched = false
        let content: CardContent
        var isDealt = false
        let id: Int
    }
}
