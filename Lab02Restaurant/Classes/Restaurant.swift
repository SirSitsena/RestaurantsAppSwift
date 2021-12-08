//
//  Restaurant.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import Foundation
import Combine

struct Initial: Decodable {
    
    let restaurants: [Restaurant]
    
}

struct Restaurants: Decodable {
    
    let restaurants: [Restaurant]

}

struct Restaurant: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let image: String
    let url: String
    let menu: String
    let telefon: String
    let categories: [String]
    let openingHours: openHours
    let location: Location
    
}
