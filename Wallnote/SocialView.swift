//
//  SocialView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI
import UIKit

struct SocialView: View {
    let appStoreURL = URL(string: "https://apps.apple.com/th/app/wallnote/id6480289629")!
    let websiteURL = URL(string: "https://www.nayaca.com")!
    let email = "hello@nayaca.com"
    
    var body: some View {
        VStack {
            Text("Social.")
                .fontWeight(.bold)
            + Text(" Don't be shy.")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
                
        VStack {
            Text("Share Wallnote with your friends. ♥️")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

        VStack {
            Text("Rate Wallnote and write a review. ⭐️")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        VStack {
            Text("Send us an email. 📧")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        VStack {
            HStack {
                Text("Visit our website. ")
                Image("NayacaFavicon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                    .frame(height: UIFont.preferredFont(forTextStyle: .body).pointSize)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .contextMenu {
            Button(action: copyLink) {
                Label("Copy Link", systemImage: "doc.on.doc")
            }
            
            Button(action: copyEmail) {
                Label("Copy Email Address", systemImage: "doc.on.doc")
            }
        }
        Spacer()
        HStack {
                        
            Button(action: shareApp) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Illuminating"))
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
            }
            Button(action: rateApp) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Illuminating"))
                    Image(systemName: "star")
                        .foregroundColor(.black)
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
            }
            Button(action: composeEmail) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Illuminating"))
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
            }
            Button(action: {
                    UIApplication.shared.open(websiteURL)
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("Illuminating"))
                    Image("NayacaFaviconTransparentBlack")
                        .resizable()
                        .frame(width: buttonEmojiFontSize,
                               height: buttonEmojiFontSize)
                        .font(.system(size: buttonEmojiFontSize))
                }
                .frame(width: 55, height: 55)
            }
        }
        Spacer()
    }
    
    func shareApp() {
        let activityItems: [Any] = [appStoreURL, email]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
            activityViewController.popoverPresentationController?.sourceView = window
        
        
        window.rootViewController?.present(activityViewController, animated: true, completion: nil)
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
    
    func copyEmail() {
        UIPasteboard.general.string = email
    }
    
    func rateApp() {
        UIApplication.shared.open(appStoreURL)
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color("Illuminating"), lineWidth: 1)
            )
            .foregroundColor(Color("Illuminating"))
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}
