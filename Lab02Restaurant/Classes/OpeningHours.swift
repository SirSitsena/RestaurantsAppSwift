//
//  OpeningHours.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import Foundation
import Combine

struct openingHours {
    var mon: String = ""
    var tue: String = ""
    var wed: String = ""
    var thu: String = ""
    var fri: String = ""
    var sat: String = ""
    var sun: String = ""
    
    init( mon: String, tue: String, wed: String, thu: String, fri: String, sat: String, sun: String){
        self.mon = mon
        self.tue = tue
        self.wed = wed
        self.thu = thu
        self.fri = fri
        self.sat = sat
        self.sun = sun
    }
}
