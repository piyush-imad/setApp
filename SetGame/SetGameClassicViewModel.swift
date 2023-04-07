//
//  SetGameClassicViewModel.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

class SetGameClassicViewModel: ObservableObject {
    typealias ClassicContent = ClassicSetGameContent.ClassicCardContent
    
    static func createSetGame() -> SetGameModel<ClassicContent> {
        SetGameModel<ClassicContent>(){ pairIndex in
            let content = ClassicSetGameContent()
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
    
    // MARK: - Intent(s)
    
    func cards() -> [SetGameModel<ClassicContent>.Card] {
        model.cards
    }
    
    func choose(_ card: SetGameModel<ClassicContent>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = SetGameClassicViewModel.createSetGame()
    }
}

