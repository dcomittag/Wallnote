//
//  WallnoteApp.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

@main
struct WallnoteApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var appState = AppState()
    var sharedSettings = SharedSettings()
    
    @StateObject private var viewmodel = WallnoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewmodel)
                .environmentObject(appState)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(sharedSettings)
        }
    }
}
