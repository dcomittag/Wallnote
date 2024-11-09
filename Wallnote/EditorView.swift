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
        NavigationView {
            ZStack {
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
                        
                        TextEditor(text: $sharedSettings.editorText)
                            .focused($isTextEditorFocused)
                            .foregroundColor(sharedSettings.textColor)
                            .background(Color.black.opacity(0))
                            .frame(width: geometry.size.width, height: geometry.size.width) // Use the full width for the TextEditor
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                }
                if !isTextEditorFocused {
                    VStack {
                        Spacer()
                        buttonBar
                            .padding() // Adjust for safe area
                    }
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        isTextEditorFocused = false // Dismisses the keyboard
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
                Button(action: { appState.selectedView = .stylingView }) {
                    
                    ZStack {
                        Circle().foregroundColor(colorScheme == .dark ? .white : .black)
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                .font(.system(size: 28))
                    }
                    .frame(width: 55, height: 55)
                    .padding()
                }
                .frame(width: 55, height: 55)
                .padding()
                
                Button(action: { appState.selectedView = .preView }) {
                    ZStack {
                        Circle().foregroundColor(colorScheme == .dark ? .white : .black)
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                .font(.system(size: 28))
                    }
                    .frame(width: 55, height: 55)
                    .padding()
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(Color.clear)
        }
}

#Preview {
    EditorView()
}
