//
//  FinalView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct FinalView: View {
    @EnvironmentObject var viewModel: WallnoteViewModel
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("NayacaFaviconTransparentBlack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            .padding()
            .padding(.top)
            Spacer()
            VStack {
                Image("WallnoteLogoTransparent")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
//                Text("Welcome to")
//                    .customTitleText()
//
//                Text("Wallnote")
//                    .customTitleText()
            }
            .padding()
            
            VStack {
                Text("Select the screenshot in your Photos app and use as wallpaper.")
            }
            .multilineTextAlignment(.center)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            
            Spacer()

            Button {
                appState.selectedView = .startView
            } label: {
                ZStack {
                    Circle().foregroundColor(.black)
                    Text("📸")
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
                .padding()
            }
            
            .padding()
        }
        .foregroundColor(.black)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Illuminating"))
        .edgesIgnoringSafeArea(.all)
    }
}



#Preview {
    FinalView()
}
