//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Winson Chow on 6/3/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
