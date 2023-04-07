//
//  SetGameModel.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import Foundation

struct SetGameModel<CardContent> {
    var cards: Array<Card>
    
    var dealtCards: Array<Card> {
        cards.filter({ $0.isDealt })
    }
    
    init(createCardContent: (Int) -> CardContent) {
        cards = []
        for num in 0..<27 {
            cards.append(Card(content: createCardContent(num), id: num))
        }
        cards.shuffle()
        for index in 0..<12 {
            cards[index].isDealt = true
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    func deal3MoreCards() {
        
    }
    
    struct Card: Identifiable {
        var isSelected = false // need to change this to something more ephemeral friendly apparently??
        var isMatched = false
        let content: CardContent
        var isDealt = false
        let id: Int
    }
}
