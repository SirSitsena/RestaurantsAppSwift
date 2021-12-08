//
//  dataFetcher.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import Foundation
import Combine
import UIKit

class dataFetcher: ObservableObject {
    
    @Published var restaurants: [Restaurant]?
    @Published var isLoading = false
    
    
    private var cancellableTask: AnyCancellable?
    
    
    func fetch() {
        isLoading = true
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        cancellableTask = URLSession.shared
            .dataTaskPublisher(for: URL(string: "https://pixelkind.github.io/ju-iOS-Development-2021/FoodGuide/restaurants.json")!)
                    .tryMap{ element -> Data in
                        guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return element.data
                    }
                    .decode(type: Initial.self , decoder: jsonDecoder)
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { [weak self] completion in
                        self?.isLoading = false
                        print(completion)
                    }, receiveValue: { [weak self] data in
                        self?.restaurants = data.restaurants
                    })
        
    }
    
    func returnRandom() -> Restaurant?{
        if restaurants != nil{
            return self.restaurants![Int.random( in: 0...3)]
        } else {
            return nil
        }
    }
}
