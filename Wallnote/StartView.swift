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
                            GlassButton(systemName: "photo.badge.plus") {
                                isPickerPresented = true
                            }
                            // Button to reuse the selected image (if available)
                            if viewModel.selectedImage != nil {
                                GlassButton(systemName: "photo.badge.checkmark") {
                                    viewModel.saveSelectedImage()
                                    appState.selectedView = .stylingView
                                }
                            }
                        }
                    }
                    .padding(.bottom, SafeArea.bottom)
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
