//
//  PreView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct PreView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    
    @State private var editorText: String = ""
    @FocusState private var isTextEditorFocused: Bool
    
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
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
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
                    .safeAreaInset(edge: .bottom) {
                        VStack {
                            Spacer()
                            buttonBar
                        }
                        .padding(.bottom, SafeArea.bottom)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    var buttonBar: some View {
        HStack(spacing: 20) {
            GlassButton(systemName: "pencil.and.scribble") {
                appState.selectedView = .editorView
            }
            Button{
                appState.selectedView = .screenshotView
            } label: {
                VStack {
                    Text("HIDE CONTROLS")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    Text("Use device buttons\nto take screenshot")
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .frame(height: 55)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Indigo"))
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .contentShape(Capsule())
        }
    }
}

