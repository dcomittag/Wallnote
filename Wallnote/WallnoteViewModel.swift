//
//  WallnoteViewModel.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI
import UIKit

class WallnoteViewModel: ObservableObject {
    @Published var wallnoteModel = WallnoteModel()
    @Published var selectedImage: UIImage?
    @Published var overlayText: String = ""
    
    init() {
        // Load the previously selected image and text if necessary
        // Any initialization logic unrelated to isFirstLaunch
        loadSelectedImage()
    }
    
    func saveSelectedImage() {
        guard let imageToSave = selectedImage else { return }
        
        ImageStorage.saveImageLocally(image: imageToSave) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let url):
                    print("Image saved at: \(url)")
                    UserDefaults.standard.set(url.path, forKey: "selectedImagePath")
                    self?.loadSelectedImage()
                    
                case .failure(let error):
                    print("Error saving image: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func loadSelectedImage() {
        if let imagePath = UserDefaults.standard.string(forKey: "selectedImagePath"),
           let loadImage = UIImage(contentsOfFile: imagePath) {
            self.selectedImage = loadImage
        }
    }
}
