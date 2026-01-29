//
//  InformationDetailView.swift
//  YES
//
//  Created by Daniel Mittag on 16/4/2566 BE.
//

import SwiftUI

struct InformationDetailView: View {
    var title: String
    var message: String
    
    var body: some View {
        Text(styledText)
            .font(.title2)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var styledText: AttributedString {
        var text = AttributedString("\(title) \(message)")
        if let range = text.range(of: title) {
            text[range].font = .system(.title2, weight: .bold)
        }
        return text
    }
}

#Preview {
    InformationDetailView(title: "Hello", message: "World")
}

