//
//  Restaurant.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import Foundation
import Combine

struct Restaurant: Identifiable {
    let id: Int
    var name: String = ""
    var description: String = ""
    var url: String = ""
    let telefon: Int
    var categories = [String]()
    
    init( id: Int, name: String, description: String, url: String, telefon: Int, categories: [String] ){
        self.id = id
        self.name = name
        self.description = description
        self.url = url
        self.telefon = telefon
        self.categories = categories
    }
}
