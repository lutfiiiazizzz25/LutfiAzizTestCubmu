//
//  ImageLoader.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 07/06/23.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var donwloadedData: Data?
    
    func downloadImage(url: String){
        
        guard let imageURL = URL (string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard  let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.donwloadedData =  data
            }
        }.resume()
    }
}
