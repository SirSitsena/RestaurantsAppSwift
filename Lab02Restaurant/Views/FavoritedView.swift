//
//  TodoView.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import SwiftUI

struct FavoritedView: View {
    var body: some View {
        NavigationView{
            List {
            Text("Jönköping City Restaurants")
//                ForEach(Restaurants)
            }
        }
        
    }
}

struct FavoritedView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritedView()
    }
}
