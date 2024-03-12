//
//  File.swift
//
//
//  Created by Shaimaa Mohammed on 12/03/2024.
//

import Foundation
import UIKit

extension UIImageView {
    public func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
    
    public func imageFrom(url:URL){
        DispatchQueue.global().async { [weak self] in
          if let data = try? Data(contentsOf: url){
            if let image = UIImage(data:data){
              DispatchQueue.main.async{
                self?.image = image
              }
            }
          }
        }
      }
    
    public func setImage(from url: URL, placeholder: UIImage? = nil) async {
        self.image = placeholder
        do {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        } catch {
            print("Failed to load image: \(error)")
        }
    }
}
