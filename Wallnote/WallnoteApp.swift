//
//  WallnoteApp.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

@main
struct WallnoteApp: App {
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .system
    @StateObject var appState = AppState()
    var sharedSettings = SharedSettings()
    
    @StateObject private var viewmodel = WallnoteViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewmodel)
                .environmentObject(appState)
                .preferredColorScheme(appearanceMode.colorScheme)
                .environmentObject(sharedSettings)
        }
    }
}
