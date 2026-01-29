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
            Spacer()
            VStack {
                Text("Select the screenshot in your Photos app and use as wallpaper.")
            }
            .multilineTextAlignment(.center)
            .font(.title)
            .fontWeight(.black)
            .padding()
            Spacer()
            VStack {
                Text("Press the camera button to start over or edit.")
            }
            .multilineTextAlignment(.center)
            .font(.caption)
            .fontWeight(.bold)
            .padding()
            Button {
                appState.selectedView = .startView
            } label: {
                ZStack {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                    Text("📸")
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
                .padding()
            }
            .padding()
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Indigo"))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    FinalView()
}
