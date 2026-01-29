//
//  WelcomeView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var isFirstLaunch: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Welcome to")
                Text("Wallnote")
                    .foregroundStyle(Color("Indigo"))
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .padding()
             Spacer()
            
            VStack {
                InformationDetailView(title: "Pick a photo.", message: "Choose any picture from your library.")
                InformationDetailView(title: "Write & style.", message: "Add a note and customize it your way.")
                InformationDetailView(title: "Set as wallpaper.", message: "Keep your Wallnote in view and never miss a beat.")
            }
            .font(.title2)
            .padding()
            
            Spacer()

            Button {
                isFirstLaunch = false
            } label: {
                ZStack {
                    Circle()
                        .stroke(Color("Indigo"), lineWidth: 2)
                    Text("📸")
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
                .padding()
            }
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.black)
        .background(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

let buttonEmojiFontSize: CGFloat = 36

#Preview {
    WelcomeView(isFirstLaunch: .constant(true))
}
