//
//  AddTaskView.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import SwiftUI
import Combine


struct RestaurantsListView: View {
    @ObservedObject var fetcher: dataFetcher
    @State var ready = false
    @AppStorage("FavRests")
    private var FavRestsData: Data = Data()
    @State var newRandomRest: Restaurant?
    @State private var isActiveRandom = false
    func create(){
        fetcher.fetch()
    }
    
    var body: some View {
                NavigationView{
                    VStack{
                        HStack{
                            Text("Jönköping City Restaurants")
                            
                        }
                    List {

                        NavigationLink(destination: RandomView(restaurantFetcher: fetcher)){
                            Text("Random Restaurant")
                        }

                        if let restaurants = fetcher.restaurants{
                        ForEach(restaurants){ rest in
                            HStack{
                                NavigationLink(destination: RestaurantView(restaurant:rest)){
                                    Text(rest.name)
                                }
                            }
                        }
                        }
                    }
                    }
                    }
                    .onAppear(perform: {
                        if ready == false{
                            create()
                            ready = true
                        }
                    })
    }}
//}

//struct RestaurantsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantsListView(fetcher: dataFetcher())
//    }
//}
