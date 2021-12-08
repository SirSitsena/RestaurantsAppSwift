//
//  AddTaskView.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import SwiftUI



struct RestaurantsListView: View {
    @ObservedObject var fetcher: dataFetcher
    @State var ready = false
    func create(){
        fetcher.fetch()
    }
    
    var body: some View {
                NavigationView{
                    List {
                    Text("Jönköping City Restaurants")
                        if let restaurants = fetcher.restaurants {
                            ForEach(restaurants,  id: \.id  ){ rest in
                                HStack{
                                    Text(rest.name)
                                }
                            }
                    }
                    }
                }
                .onAppear(perform: {
                    if ready == false{
                        create()
                        //restaurants = fetcher.restaurants
                        ready = true
                    }
                    
                })
    }
}

//struct RestaurantsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantsListView(fetcher: dataFetcher())
//    }
//}
