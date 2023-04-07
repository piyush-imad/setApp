//
//  SetGameView.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

struct SetGameView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: SetGameClassicViewModel
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards()) { card in
                        CardView(card: card, color: viewModel.getContentColor(card: card))
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                }
            }
            Button(action: {
                viewModel.newGame()
            }, label: {
                Text("New Game")
                    .font(.headline)
            })
        }
        .padding()
    }
}

struct CardView: View {
    var card: SetGameModel<SetGameClassicViewModel.ClassicContent>.Card
    var color: Color
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 5).foregroundColor(.gray)
            VStack {
                ForEach(0..<card.content.number.rawValue, id: \.self) { _ in
                    ZStack{
                        let internalShape = card.content.shape
                        internalShape
                            .fill()
                            .opacity(card.content.shading.rawValue)
                        internalShape
                            .strokeBorder(lineWidth: 5)
                    }
                    .padding()
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
        ContentView(viewModel: model)
    }
}
