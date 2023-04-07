//
//  SetGameApp.swift
//  SetGame
//
//  Created by Piyush Sharma on 07/04/23.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = SetGameClassicViewModel()
            ContentView(viewModel: game)
        }
    }
}
