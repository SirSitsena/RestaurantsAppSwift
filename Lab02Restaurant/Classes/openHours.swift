//
//  OpeningHours.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import Foundation
import Combine

struct openHours: Decodable {
    
    var mon: String = ""
    var tue: String = ""
    var wed: String = ""
    var thu: String = ""
    var fri: String = ""
    var sat: String = ""
    var sun: String = ""

}
