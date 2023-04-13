//
//  ClassicSetGameContent.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

struct ClassicSetGameContent {
    
    enum Shading: CGFloat, CaseIterable {
        case partial = 0.3
        case transparent = 0
        case opaque = 1
    }

    enum CardColor: String, CaseIterable {
        case pink = "pink"
        case blue = "blue"
        case green = "green"
    }

    enum Number: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
    
    enum CardShape: String, CaseIterable {
        case rectangle = "rectangle"
        case pill = "pill"
        case diamond = "diamond"
    }

    struct ClassicCardContent {
        var color: CardColor
        var shape: CardShape
        var shading: Shading
        var number: Number
    }
    
    let contentForCards = Shading.allCases.flatMap { shade in
        CardColor.allCases.flatMap { cColor in
            CardShape.allCases.flatMap { shape in
                Number.allCases.map { num in
                    ClassicCardContent(color: cColor, shape: shape, shading: shade, number: num)
                }
            }
        }
    }
}




