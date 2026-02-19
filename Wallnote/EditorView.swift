//
//  EditorView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct EditorView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
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
            ZStack {
                GeometryReader { geometry in
                    ZStack {
                        if let image = viewModel.selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width,
                                       height: geometry.size.height)
                                .clipped()
                        } else {
                            Text("No Image Selected")
                        }
                        TextEditor(text: $sharedSettings.editorText)
                            .focused($isTextEditorFocused)
                            .foregroundColor(sharedSettings.textColor)
                            .background(Color.black.opacity(0))
                            .frame(width: geometry.size.width, height: geometry.size.width) // Use the full width for the TextEditor
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        
                    }
                }
                .ignoresSafeArea()
                .safeAreaInset(edge: .bottom) {
                    if !isTextEditorFocused {
                        VStack {
                            buttonBar
                        }
                    }
                }
                
                
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isTextEditorFocused {
                        Button("Done") {
                            isTextEditorFocused = false // Dismisses the keyboard
                        }
                        .fontWeight(.semibold)
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isTextEditorFocused = true
                }
            }
        }
    }
    
    var buttonBar: some View {
        HStack(spacing: 20) {
            GlassButton(systemName: "slider.horizontal.3") {
                appState.selectedView = .stylingView
            }
            GlassButton(systemName: "magnifyingglass") {
                appState.selectedView = .preView
            }
        }
    }
}

//#Preview {
//    EditorView()
//}
