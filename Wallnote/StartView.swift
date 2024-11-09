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
    
    
    private let halfScreenHeight = UIScreen.main.bounds.height / 2
    private let halfScreenWidth = UIScreen.main.bounds.width / 2

    var body: some View {
        NavigationStack {
        GeometryReader { geometry in
            ZStack {
                // Background color
//                Color(.black).edgesIgnoringSafeArea(.all)
                
                // Centered rectangle for image display
                Rectangle()
                    .foregroundColor(Color("Illuminating"))
                    .frame(width: halfScreenWidth, height: halfScreenHeight)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // Display the selected image within the rectangle
                if let selectedImage = viewModel.selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: halfScreenWidth, height: halfScreenHeight)
                        .clipped()
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                
                // Buttons positioned at the bottom
                VStack {
                    Spacer()
                    HStack(spacing: 20) {
                        // Button to pick a new photo
                        Button(action: { isPickerPresented = true }) {
                            ZStack {
//                                Circle().foregroundColor(.black)
                                Image(systemName: "photo.badge.plus")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                    .font(.system(size: 28)) // Adjust as necessary
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
//                                    Circle().foregroundColor(.black)
                                    Image(systemName: "photo.badge.checkmark")
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .font(.system(size: 28)) // Adjust as necessary
                                }
                                .frame(width: 55, height: 55)
                                .padding()
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: SettingsView().navigationBarBackButtonHidden(true)) {
                    ThreeLinesButton()
                }
            }
    }
    }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(isPresented: $isPickerPresented, selectedImage: $viewModel.selectedImage)
        }
    }
}

struct ThreeLinesButton: View {
    var body: some View {
        VStack(spacing: 5) {
            Rectangle().frame(width: 20, height: 2).foregroundColor(.primary)
            Rectangle().frame(width: 20, height: 2).foregroundColor(.primary)
            Rectangle().frame(width: 20, height: 2).foregroundColor(.primary)
        }
    }
}
