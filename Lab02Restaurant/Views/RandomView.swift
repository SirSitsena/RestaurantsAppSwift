//
//  RandomView.swift
//  Lab02Restaurant
//
//  Created by User on 09.12.2021.
//

import SwiftUI

struct RandomView: View {
    
    @ObservedObject var restaurantFetcher: dataFetcher
    @State var restaurant: Restaurant?
    @State var labelText: String = "Loading restaurants.."
    
    var body: some View {
        VStack {
            Button(action: {
                //test
                if self.labelText != "Loading restaurants.." {
                    if let restaurant = restaurantFetcher.returnRandom() {
                        self.restaurant = restaurant
                    } else {
                        restaurantFetcher.fetch()
                    }
                }
            }) {
                Text(labelText)
                    .font(.title2)
                    .onAppear(perform: {
                        if let restaurant = restaurantFetcher.returnRandom() {
                            self.restaurant = restaurant
                            self.labelText = "Click to show another restaurant"
                        }
                })
            }
            if let rest = self.restaurant {
                RandomRestView(restaurant: Binding(self.$restaurant)!)
            }
        }
    }
}

//struct RandomView_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomView()
//    }
//}
