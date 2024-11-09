//
//  SettingsView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                ModeSwitchView()
            }
            .tabItem {
                Label("Mode", systemImage: "lamp.desk")
            }
            .tag(0)
            
            VStack {
                SocialView()
            }
            .tabItem {
                Label("Social", systemImage: "person.3")
            }
            .tag(1)
        }
        .accentColor(Color("Illuminating"))
        .foregroundColor(.primary)
        .padding()
        .navigationTitle("Wallnote")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                NavigationLink(destination: StartView().navigationBarBackButtonHidden(true)) {
                    Image(systemName: "photo")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}
