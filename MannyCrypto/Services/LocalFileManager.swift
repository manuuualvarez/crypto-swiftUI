//
//  LocalFileManager.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//
import Foundation
import SwiftUI


enum LocalFileManagerFolders: String {
    case coins_images = "coins_images"
}

class LocalFileManager {
    static let instance = LocalFileManager()
    
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: LocalFileManagerFolders) {
        // Create folder if does not exist
        createFolderIfNeeded(folderName: folderName)
        // Get path for the image, and the image data
        guard let data = image.pngData(),
              let url = getURLForImage(imageName: imageName, folderName: folderName)
            else { return }
        // Save the data
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(error.localizedDescription), ImageName: \(imageName), FolderName: \(folderName)")
        }
    }
    
    func getImage(imageName: String, folderName: LocalFileManagerFolders) -> UIImage? {
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: LocalFileManagerFolders) {
        guard let url = getURLForFolder(name: folderName.rawValue) else {
            return
        }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory: \(error.localizedDescription), FolderName: \(folderName)")
            }
        }
    }
    
    private func getURLForFolder(name: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(name)
    }
    
    func getURLForImage(imageName: String, folderName: LocalFileManagerFolders) -> URL? {
        guard let folderURL = getURLForFolder(name: folderName.rawValue) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
