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
                Text("Your wallpaper is ready")
                    .font(.largeTitle)
                        .fontWeight(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                
                Text("Saved to Photos")
                    .fontWeight(.semibold)
            }
            .padding()
            Spacer()
            
            
            Button {
                appState.selectedView = .startView
            } label: {
                ActionSphere(imageName: "WNLogoIndigoTransparent", sphereColor: .white)
            }
        }
        .foregroundColor(.white)
        .background(Color("Indigo"))
        .ignoresSafeArea()
    }
}

#Preview {
    FinalView()
}
