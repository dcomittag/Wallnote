//
//  Extensions.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

@_exported
import SwiftUI

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}
