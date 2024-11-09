//
//  ImageStorage.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import UIKit

struct ImageStorage {
    
    static func saveImageLocally(image: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            guard let imageData = image.jpegData(compressionQuality: 1.0) else {
                DispatchQueue.main.async {
                    completion(.failure(NSError(domain: "ImageConversionError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to JPEG data."])))
                }
                return
            }

            let fileManager = FileManager.default
            guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }

            let fileName = "savedImage_\(UUID().uuidString).jpg"
            let fileURL = documentsDirectory.appendingPathComponent(fileName)

            do {
                try imageData.write(to: fileURL, options: .atomic)
                DispatchQueue.main.async {
                    completion(.success(fileURL))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
