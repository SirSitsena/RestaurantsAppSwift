//
//  imageFetcher.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07. // Honestly stolen from Rasmus Kolmodin
//

import Foundation
//
//class ImageFetcher: ObservableObject {
//    @Published var image: UIImage = UIImage()
//    
//    func loadImage(for urlString: String) {
//        guard let url = URL(string: urlString) else {return}
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.image = UIImage(data: data) ?? UIImage()
//            }
//        }
//        task.resume()
//    }
//}
