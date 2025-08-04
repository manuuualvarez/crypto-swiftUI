//
//  CoinImageService.swift
//  MannyCrypto
//
//  Created by Manuel Alvarez on 02/08/2025.
//

import Combine
import SwiftUI

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSuscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: .coins_images) {
            self.image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else {
            return
        }
        imageSuscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self,
                      let downloadedImage = returnedImage
                else { return }
                self.image = downloadedImage
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: .coins_images)
                self.imageSuscription?.cancel()
            })
    }
}
