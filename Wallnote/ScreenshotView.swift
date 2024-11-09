//
//  ScreenshotView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct ScreenshotView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    
    @State private var editorText: String = ""
        @FocusState private var isTextEditorFocused: Bool

//    @State private var userText: String = ""
//    @State private var showPlaceholder: Bool = true
//    private var placeholder: String = "Enter text here..."
    
    @EnvironmentObject var sharedSettings: SharedSettings
    
        private let fontWeights: [Font.Weight] = [
            .ultraLight, .thin, .light, .regular, .medium,
            .semibold, .bold, .heavy, .black
        ]
        
        private var selectedFontWeight: Font.Weight {
            let index = min(max(Int(sharedSettings.fontWeightIndex), 0), fontWeights.count - 1)
            return fontWeights[index]
        }
    
        private let baseFontSize: CGFloat = 16
    
    var body: some View {
        ZStack {
        NavigationView {
            
            GeometryReader { geometry in
                ZStack {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .clipped()
                            .edgesIgnoringSafeArea(.all)
                    } else {
                        Text("No Image Selected")
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(sharedSettings.squareOpacity)
                            .frame(width: geometry.size.width, height: geometry.size.width)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        
                        Text(sharedSettings.editorText)
                            .font(.system(size: baseFontSize * sharedSettings.textSizeMultiplier, weight: selectedFontWeight))
                            .foregroundColor(sharedSettings.textColor)
                            .frame(width: geometry.size.width-40, height: geometry.size.width-40) // Use the full width for the TextEditor
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                    
                    
                    
                }
            }
        }
    }
        .statusBar(hidden: true)
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIApplication.userDidTakeScreenshotNotification,
                object: nil,
                queue: .main) { _ in
                    appState.navigateToFinalView()
                }
        }

    }
}
