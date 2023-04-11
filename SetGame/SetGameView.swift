//
//  SetGameView.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameClassicViewModel
    var body: some View {
        VStack {
            if viewModel.cards().count <= 12 {
                AspectVGrid(items: viewModel.cards(), aspectRatio: 2/3) { card in
                    CardView(card: card, color: viewModel.getContentColor(card: card), shape: viewModel.getContentShape(card: card))
                        .padding(2)
                }
                .padding()
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        ForEach(viewModel.cards()) { card in
                            CardView(card: card, color: viewModel.getContentColor(card: card), shape: viewModel.getContentShape(card: card))
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            HStack {
                Spacer()
                
                
                Button(action: {
                    viewModel.deal3MoreCards()
                }, label: {
                    Text("Deal 3 More Cards")
                        .font(.headline)
                })
                
                Spacer()
                
                Button(action: {
                    viewModel.newGame()
                }, label: {
                    Text("New Game")
                        .font(.headline)
                })
                
                Spacer()
            }
        }
        .padding()
    }
}

struct CardView: View {
    var card: SetGameModel<SetGameClassicViewModel.ClassicContent>.Card
    var color: Color
    var shape: AnyShape
    var body: some View {
        ZStack {
            let rectShape = RoundedRectangle(cornerRadius: 20)
            rectShape.fill().foregroundColor(.white)
            rectShape.strokeBorder(lineWidth: 5).foregroundColor(.gray)
            VStack {
                ForEach(0..<card.content.number.rawValue, id: \.self) { _ in
                    ZStack {let internalShape = shape
                        internalShape
                            .fill()
                            .opacity(card.content.shading.rawValue)
                        internalShape
                            .stroke(lineWidth: 5)
                    }
                    .padding(12)
                    .foregroundColor(color)
                    .aspectRatio(2/1, contentMode: .fit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = SetGameClassicViewModel()
        SetGameView(viewModel: model)
    }
}
