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
        return SetGameModel<ClassicContent>(){ pairIndex in
            return content.contentForCards[pairIndex]
        }
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
    
    func getContentShapeTest(type: Int = 1) -> any Shape {
        var testShape: any Shape = RoundedRectangle(cornerRadius: 10)
        testShape = Circle()
        return testShape
    }
    
    // MARK: - Intent(s)
    
    func cards() -> [SetGameModel<ClassicContent>.Card] {
        model.dealtCards
    }
    
    func deal3MoreCards() {
        model.deal3MoreCards()
    }
    
    func choose(_ card: SetGameModel<ClassicContent>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = SetGameClassicViewModel.createSetGame()
    }
}

