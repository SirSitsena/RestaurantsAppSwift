//
//  TodoView.swift
//  Lab02Restaurant
//
//  Created by Anestis Cheimonettos on 2021-12-07.
//

import SwiftUI

struct FavoritedView: View {
    @AppStorage("FavRests")
    private var FavRestsData: Data = Data()
    @State var restaurants: [Restaurant]?
    var body: some View {
        NavigationView{
            
            VStack{
                Text("Jönköping City Restaurants")
                    if let restaurants = restaurants {
                        List {
                            ForEach(restaurants ){ rest in
                                NavigationLink(destination: RestaurantView(restaurant:rest)){
                                    Text(rest.name)
                                }
                            }
                        }
                    }
                
        }.onAppear(perform: {
                guard let sController = try? JSONDecoder().decode(saveController.self, from: FavRestsData) else {
                    //No restaurants saved to the device
                    return
                }
                self.restaurants = sController.restaurants
        })
        }
        }
        
    }
//
//struct FavoritedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritedView()
//    }
//}
