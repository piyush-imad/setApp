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
    var isMatchedTrioAvailable = false
    var dealtCards: Array<Card> {
    get { Array(cards[0...dealtCardsIndex]) }
    }
    
    var selectedCards = Array<Card>()
    
    init(createCardContent: (Int) -> CardContent) {
        cards = []
        
        for num in 0..<81 {
            cards.append(Card(content: createCardContent(num), id: num))
        }
        
        cards.shuffle()
        
        dealtCardsIndex = 11
        
    }
    
    mutating func updateMatchedCards(_ matchedCards: Array<Card>) {
        selectedCards.forEach { card in
            let matchedCardIndex = cards.firstIndex(where: {$0.id == card.id})
            cards[matchedCardIndex!].isMatched = true
        }
        isMatchedTrioAvailable = true
    }
    
    mutating func choose(_ card: Card) {
        // find card in cards array
        // change isSelected
        
        if isMatchedTrioAvailable {
            cards.removeAll(where: {$0.isMatched})
            isMatchedTrioAvailable = false
            dealtCardsIndex -= 3
            deal3MoreCards()
            selectedCards.removeAll()
        } else if(selectedCards.count == 3) {
            selectedCards.forEach { card in
                let selectedCardIndex = cards.firstIndex(where: {$0.id == card.id})
                cards[selectedCardIndex!].isSelected = false
            }
            selectedCards.removeAll()
        }
        
        let newSelectedCardIndex = cards.firstIndex(where: {$0.id == card.id})
        selectedCards.append(cards[newSelectedCardIndex!])
        cards[newSelectedCardIndex!].isSelected = true
        
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
