//
//  SocialView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI
import UIKit

struct MoreView: View {
    let appStoreURL = URL(string: "https://apps.apple.com//app/idxxx")!
    let websiteURL = URL(string: "https://www.nayaca.com")!
    let email = "hello@nayaca.com"
    
    var body: some View {
        VStack {
//            Button {
//                shareApp()
//            } label: {
//                Text("♥️ Share Wallnote")
//                    .padding(.vertical, 8)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .contentShape(Rectangle())
//            }
//            .contextMenu {
//                Button(action: copyLink) {
//                    Label("Copy Link", systemImage: "doc.on.doc")
//                }
//            }
//            Divider()
//            Button {
//                rateApp()
//            } label: {
//                Text("⭐️ Rate Wallnote")
//                    .padding(.vertical, 8)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .contentShape(Rectangle())
//            }
//            Divider()
            Button {
                composeEmail()
            } label: {
                Text("📧 Send us an email")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
            Divider()
            Button {
                UIApplication.shared.open(websiteURL)
            } label: {
                Text("🌐 Visit our website")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
            Spacer()
        }
        .buttonStyle(.plain)
        .foregroundStyle(.primary)
        .fontWeight(.semibold)
        .padding()
    }
    
    func shareApp() {
        let activityItems: [Any] = [appStoreURL] // only share the App Store link
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // Get the topmost view controller safely
        if let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
           let rootVC = windowScene.windows.first?.rootViewController {
            
            // For iPad: prevent popover crash
            activityVC.popoverPresentationController?.sourceView = rootVC.view
            activityVC.popoverPresentationController?.sourceRect = rootVC.view.bounds
            
            rootVC.present(activityVC, animated: true)
        }
    }
    
    func copyLink() {
        UIPasteboard.general.string = appStoreURL.absoluteString
    }
    
    func composeEmail() {
        if let emailURL = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(emailURL)
        }
    }
    
    func rateApp() {
        UIApplication.shared.open(appStoreURL)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
