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
    
    enum CardShape: String {
        case rectangle = "rectangle"
        case pill = "pill"
        case diamond = "diamond"
    }

    struct ClassicCardContent {
        var color: CardColor
        var shape: any Shape
        var shading: Shading
        var number: Number
    }
    
    var contentForCards: Array<ClassicCardContent> {
        var contentArray = Array<ClassicCardContent>()
        for shade in Shading.allCases {
            for cColor in CardColor.allCases {
                for num in Number.allCases {
                    contentArray.append(ClassicCardContent(color: cColor, shape: Rectangle(), shading: shade, number: num))
                }
            }
        }
        return contentArray
    }
}




