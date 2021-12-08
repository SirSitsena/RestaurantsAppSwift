//
//  ContentView.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fetcher = dataFetcher()
    
    var body: some View {
        TabView {
            RestaurantsListView( fetcher: fetcher )
                .tabItem {
                    Text("Restaurants")
                    Image(systemName: "pencil")
                }
            FavoritedView()
                .tabItem {
                    Text("Favorited")
                    Image(systemName: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
