//
//  StartView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI
import PhotosUI

struct StartView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var isPickerPresented = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let halfScreenHeight = geometry.size.height / 2
                let halfScreenWidth = geometry.size.width / 2
                ZStack {
                    // Placeholder rectangle
                    Rectangle()
                        .foregroundColor(Color("Indigo"))
                        .frame(width: halfScreenWidth, height: halfScreenHeight)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    // Display selected image in rectangle
                    if let selectedImage = viewModel.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: halfScreenWidth, height: halfScreenHeight)
                            .clipped()
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    //                // Buttons positioned at the bottom
                    VStack {
                        HStack(spacing: 20) {
                            // Button to pick a new photo
                            Button(action: { isPickerPresented = true }) {
                                ZStack {
                                    Circle().stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                                    Image(systemName: "photo.badge.plus")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .font(.system(size: 28))
                                }
                                .frame(width: 55, height: 55)
                                .padding()
                            }
                            
                            // Button to reuse the selected image (if available)
                            if viewModel.selectedImage != nil {
                                Button(action: {
                                    viewModel.saveSelectedImage()
                                    appState.selectedView = .stylingView
                                }) {
                                    ZStack {
                                        Circle().stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                                        Image(systemName: "photo.badge.checkmark")
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                            .font(.system(size: 28))
                                    }
                                    .frame(width: 55, height: 55)
                                    .padding()
                                }
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .padding(.bottom, 20)
                }
                
                
            }
            .ignoresSafeArea()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: SettingsView().navigationBarBackButtonHidden(true)) {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(isPresented: $isPickerPresented, selectedImage: $viewModel.selectedImage)
        }
    }
}

#Preview {
    StartView()
        .environmentObject(WallnoteViewModel())
}
