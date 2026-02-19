//
//  StylingView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct StylingView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var sharedSettings: SharedSettings
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme
    
    private let fontWeights: [Font.Weight] = [
        .ultraLight, .thin, .light, .regular, .medium,
        .semibold, .bold, .heavy, .black
    ]
    
    private var selectedFontWeight: Font.Weight {
        let index = min(max(Int(sharedSettings.fontWeightIndex), 0), fontWeights.count - 1)
        return fontWeights[index]
    }
    
    private let baseFontSize: CGFloat = 16
    
    var topSafeArea: CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window.safeAreaInsets.top
        }
        return 0
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if let image = viewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                } else {
                    Text("No Image Selected")
                }
                
                VStack {
                    VStack(spacing: 4) {
                        HStack {
                            Text("Opacity")
                            Slider(value: $sharedSettings.squareOpacity, in: 0...1, step: 0.1)
                                .padding(.horizontal)
                                .accentColor(.primary)
                        }
                        .padding(.horizontal)
                        HStack {
                            Text("Text size")
                            Slider(value: $sharedSettings.textSizeMultiplier, in: 1.0...2.0, step: 0.1)
                                .padding(.horizontal)
                                .accentColor(.primary)
                        }
                        .padding(.horizontal)
                        HStack {
                            Text("Text weight")
                            Slider(value: $sharedSettings.fontWeightIndex, in: 0...Double(fontWeights.count - 1), step: 1)
                                .padding(.horizontal)
                                .accentColor(.primary)
                        }
                        .padding(.horizontal)
                        HStack {
                            Text("Text color")
                            ColorPicker("", selection: $sharedSettings.textColor)
                                .padding(.horizontal)
                                .accentColor(.primary)
                            
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .padding(.top, topSafeArea)
                    Spacer()
                        .safeAreaInset(edge: .bottom) {
                            VStack {
                                HStack(spacing: 20) {
                                    GlassButton(systemName: "photo") {
                                        appState.selectedView = .startView
                                    }
                                    
                                    GlassButton(systemName: "pencil.and.scribble") {
                                        appState.selectedView = .editorView
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.bottom, SafeArea.bottom)
                            }
                        }
                }
                
                
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(sharedSettings.squareOpacity)
                        .frame(width: geo.size.width, height: geo.size.width)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    
                    Text("Wallnote rocks!")
                        .font(.system(size: baseFontSize * sharedSettings.textSizeMultiplier, weight: selectedFontWeight))
                        .foregroundColor(sharedSettings.textColor)
                        .frame(width: geo.size.width-40, height: geo.size.width-40) // Use the full width for the TextEditor
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                }
            }
        }
        .ignoresSafeArea()
    }
}

