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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView()
    }
}
