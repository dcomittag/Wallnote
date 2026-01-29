//
//  SettingsHeadlineView.swift
//  YES
//
//  Created by Daniel Mittag on 7/1/2569 BE.
//

import SwiftUI

struct SettingsHeadlineView: View {
    var title: String
    var message: String
    var inlineImage: Image? = nil
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            Text(styledText)
            inlineImage?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIFont.preferredFont(forTextStyle: .body).pointSize)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var styledText: AttributedString {
        var text = AttributedString("\(title) \(message)")
        if let range = text.range(of: title) {
            text[range].inlinePresentationIntent = .stronglyEmphasized
        }
        return text
    }
}

#Preview {
    SettingsHeadlineView(title: "Un", message: "Deux")
}
