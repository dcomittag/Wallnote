//
//  StylingView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct StylingView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState
    @Environment(\.colorScheme) var colorScheme

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
                VStack {
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
                    Spacer()
                }
                .padding(.horizontal)
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(sharedSettings.squareOpacity)
                        .frame(width: geometry.size.width, height: geometry.size.width)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    Text("Wallnote rocks!")
                        .font(.system(size: baseFontSize * sharedSettings.textSizeMultiplier, weight: selectedFontWeight))
                        .foregroundColor(sharedSettings.textColor)
                        .frame(width: geometry.size.width-40, height: geometry.size.width-40) // Use the full width for the TextEditor
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                
                
                VStack {
                    Spacer()
                    HStack(spacing: 20) {
                        // Button to pick a new photo
                        Button { appState.selectedView = .startView } label: {
                            ZStack {
                                Circle().foregroundColor(colorScheme == .dark ? .white : .black)
                                Image(systemName: "photo")
                                    .foregroundColor(colorScheme == .dark ? .black : .white)
                                    .font(.system(size: 28)) // Adjust as necessary
                            }
                            .frame(width: 55, height: 55)
                            .padding()
                        }
                        
                            Button {
                                appState.selectedView = .editorView
                                
                            } label: {
                                ZStack {
                                    Circle().foregroundColor(colorScheme == .dark ? .white : .black)
                                    Image(systemName: "pencil.and.scribble")
                                        .foregroundColor(colorScheme == .dark ? .black : .white)
                                        .font(.system(size: 28)) // Adjust as necessary
                                }
                                .frame(width: 55, height: 55)
                                .padding()
                            }
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding(.bottom, 50)
//                VStack {
//                    HStack {
//                        Button {
//                            appState.selectedView = .main
//                        } label: {
//                            Image(systemName: "photo")
//                        }
//                        Button {
//                            appState.selectedView = .main
//                        } label: {
//                            Image(systemName: "pencil.and.scribble")
//                        }
//                    }
//
//                }
                    
                    
                
                
//                VStack {
//                    Spacer()
//                    HStack(spacing: 20) {
//                        // Button to pick a new photo
//                        Button(action: { isPickerPresented = true }) {
//                            ZStack {
////                                Circle().foregroundColor(.black)
//                                Image(systemName: "photo.badge.plus")
//                                    .foregroundColor(colorScheme == .dark ? .white : .black)
//                                    .font(.system(size: 28)) // Adjust as necessary
//                            }
//                            .frame(width: 55, height: 55)
//                            .padding()
//                        }
//
//                        // Button to reuse the selected image (if available)
//                        if viewModel.selectedImage != nil {
//                            Button(action: {
//                                viewModel.saveSelectedImage()
//                                appState.selectedView = .editingView
//
//                            }) {
//                                ZStack {
////                                    Circle().foregroundColor(.black)
//                                    Image(systemName: "photo.badge.checkmark")
//                                        .foregroundColor(colorScheme == .dark ? .white : .black)
//                                        .font(.system(size: 28)) // Adjust as necessary
//                                }
//                                .frame(width: 55, height: 55)
//                                .padding()
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//                    .padding(.bottom, 20)
//                }
            }
        }
    }
}
