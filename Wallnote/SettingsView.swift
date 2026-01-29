//
//  SettingsView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct SettingsView: View {
    private var navigationTitleText: String {
        switch selectedTab {
        case 0: return "Customize your experience"
        case 1: return "Don’t be shy"
        default: return ""
        }
    }
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
                MoreView()
            }
            .tabItem {
                Label("More", systemImage: "ellipsis.circle")
            }
            .tag(1)
        }
        .accentColor(Color("Indigo"))
        .foregroundColor(.primary)
        .padding()
        .navigationTitle(navigationTitleText)
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
