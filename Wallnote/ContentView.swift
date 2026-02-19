//
//  ContentView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            if isFirstLaunch {
                WelcomeView {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isFirstLaunch = false
                    }
                }
                .transition(.opacity)
            } else {
                switch appState.selectedView {
                case .startView:
                    StartView()
                case .stylingView:
                    StylingView()
                case .editorView:
                    EditorView()
                case .preView:
                    PreView()
                case .screenshotView:
                    ScreenshotView()
                case .finalView:
                    FinalView()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
