//
//  ModeSwitchView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct ModeSwitchView: View {
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .system
    
    var body: some View {
        VStack {
            Text("Appearance")
                .font(.headline)
            VStack {
                Picker("Appearance", selection: $appearanceMode) {
                    ForEach(AppearanceMode.allCases) { mode in
                        Text(mode.title).tag(mode)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
        .padding()
        Spacer()
    }
}

struct ModeSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSwitchView()
    }
}
