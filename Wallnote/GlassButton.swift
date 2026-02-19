//
//  GlassButton.swift
//  Wallnote
//
//  Created by Daniel Mittag on 10/2/2569 BE.
//

import SwiftUI

struct GlassButton: View {
    let systemName: String
    let action: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 33))
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .frame(width: 55, height: 55)
        }
        .buttonStyle(.glass)
        .clipShape(Circle())
        .contentShape(Circle())
    }
}

#Preview {
    GlassButton(systemName: "car", action: {} )
}
