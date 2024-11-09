//
//  AppState.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import Foundation

class AppState: ObservableObject {
    @Published var selectedView: ViewType = .startView
    
    // Add other cases as necessary
    enum ViewType {
        case startView, stylingView, editorView, preView, screenshotView, finalView
    }
    
    // Method to switch to the final view
    func navigateToFinalView() {
        self.selectedView = .finalView
    }
}
