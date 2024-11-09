//
//  SharedSettings.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI
import Combine

class SharedSettings: ObservableObject {
    @Published var squareOpacity: Double = 0.5
    @Published var textSizeMultiplier: Double = 1.0
    @Published var fontWeightIndex: Double = 4 // Defaults to .regular
    @Published var textColor: Color = Color("Illuminating")
    @Published var editorText: String = ""
}
