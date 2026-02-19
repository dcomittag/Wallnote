//
//  WelcomeView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct WelcomeView: View {
    
    let welcomed: () -> Void
    
    var body: some View {
            
            VStack {
                Spacer()
                
                VStack(spacing: 6) {
                    Text("Wallnote")
                        .foregroundStyle(Color("Indigo"))
                        .font(.system(size: 40, weight: .black))
                    Text("Notes that stay with you")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                    Button {
                        welcomed()
                    } label: {
                        ActionSphere(imageName: "WNLogoWhiteTransparent", sphereColor: Color("Indigo"))
                    }
            }
            .foregroundStyle(.black)
            .background(.white)
            .ignoresSafeArea()
        }
}

let buttonEmojiFontSize: CGFloat = 36

#Preview {
    WelcomeView(welcomed: {})
}
