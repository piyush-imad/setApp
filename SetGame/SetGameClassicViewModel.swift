//
//  SetGameClassicViewModel.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

class SetGameClassicViewModel: ObservableObject {
    typealias ClassicContent = ClassicSetGameContent.ClassicCardContent
    
    static let content = ClassicSetGameContent()
    
    static func createSetGame() -> SetGameModel<ClassicContent> {
        print(content)
        print(content.contentForCards.count)
        return SetGameModel<ClassicContent>( createCardContent: { pairIndex in
            return content.contentForCards[pairIndex]
        })
    }
    
    init() {
        model = SetGameClassicViewModel.createSetGame()
    }
    
    @Published private var model: SetGameModel<ClassicContent>
    
    func getContentColor(card: SetGameModel<ClassicContent>.Card) -> Color {
        var themeColor: Color
        
        switch card.content.color {
        case .pink:
            themeColor = Color.pink
        case .green:
            themeColor = Color.green
        case .blue:
            themeColor = Color.blue
        }
        return themeColor
    }
    
    func getContentShape(card: SetGameModel<ClassicContent>.Card) -> AnyShape {
        
        var finalShape: AnyShape
        
        switch card.content.shape {
        case .rectangle:
            finalShape = AnyShape(Rectangle())
        case .pill:
            finalShape = AnyShape(Capsule())
        case .diamond:
            finalShape = AnyShape(Circle())
        }
        
        return finalShape
    }
        
    func isMatchedCards(cards: Array<SetGameModel<ClassicContent>.Card>) -> Bool {
        var numSet = Set<ClassicSetGameContent.Number>()
        var shapeSet = Set<ClassicSetGameContent.CardShape>()
        var shadingSet = Set<ClassicSetGameContent.Shading>()
        var colorSet = Set<ClassicSetGameContent.CardColor>()
        
        for card in cards {
            numSet.insert(card.content.number)
            shapeSet.insert(card.content.shape)
            shadingSet.insert(card.content.shading)
            colorSet.insert(card.content.color)
        }
        
        return (numSet.count == 1 || numSet.count == 3)
        && (shapeSet.count == 1 || shapeSet.count == 3)
        && (shadingSet.count == 1 || shadingSet.count == 3)
        && (colorSet.count == 1 || colorSet.count == 3)
    }
    
    // MARK: - Intent(s)
    
    func cards() -> [SetGameModel<ClassicContent>.Card] {
        model.dealtCards
    }
    
    func deal3MoreCards() {
        model.deal3MoreCards()
    }
    
    func choose(_ card: SetGameModel<ClassicContent>.Card) {
        if card.isMatched {
            return
        }
        
        model.choose(card)
        if model.selectedCards.count == 3 {
            let isMatched = isMatchedCards(cards: model.selectedCards)
            if isMatched {
                model.updateMatchedCards(model.selectedCards)
            }
        }
    }
    
    func newGame() {
        model = SetGameClassicViewModel.createSetGame()
    }
}

