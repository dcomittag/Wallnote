//
//  ActionSphere.swift
//  Wallnote
//
//  Created by Daniel Mittag on 11/2/2569 BE.
//

import SwiftUI

struct ActionSphere: View {
    let imageName: String
    let sphereColor: Color
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle()
                    .fill(Color(sphereColor))
                    .frame(width: geo.size.width,
                           height: geo.size.width)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width / 4)
                    .offset(y: -geo.size.width / 4)
            }
        }
        .aspectRatio(2, contentMode: .fit)   // width : height = 2 : 1
        .clipped()
    }
}

#Preview {
    ActionSphere(imageName: "Launchscreen", sphereColor: Color("Indigo"))
}


