//
//  RestaurantView.swift
//  Lab02Restaurant
//
//  Created by User on 09.12.2021.
//

import SwiftUI

struct RestaurantView: View {
    
    let restaurant: Restaurant
    
    @AppStorage("FavRests")
    private var FavRestsData: Data = Data()
    //-----------------------------------------FUNCTIONS-START
    //------------------------FUNC-1
    func checkSaved() -> Bool{
        guard let sController = try? JSONDecoder().decode(saveController.self, from: FavRestsData) else {
            //No restaurants saved to the device
            return false
        }
        var found = false
        for rest in (sController.restaurants){
            if rest.id == restaurant.id{
                found = true
            }
        }
        return found
    }
    //------------------------FUNC-2
    func saveToController(){
        guard let sController = try? JSONDecoder().decode(saveController.self, from: FavRestsData) else {
            //No restaurants saved to the device
            var newArray = [Restaurant]()
            newArray.append(restaurant)
            let FavRests = saveController(restaurants:newArray)
            guard let FavRestsData = try? JSONEncoder().encode(FavRests) else {return}
            self.FavRestsData = FavRestsData
            return
        }
        var newArray = sController.restaurants
        newArray.append(restaurant)
        let FavRests = saveController(restaurants:newArray)
        guard let FavRestsData = try? JSONEncoder().encode(FavRests) else {return}
        self.FavRestsData = FavRestsData
    }
    //------------------------FUNC-3
    func deleteFromController(){
        guard let sController = try? JSONDecoder().decode(saveController.self, from: FavRestsData) else {
            //No restaurants saved to the device
            return
        }
        var newArray = [Restaurant]()
        var oldArray = sController.restaurants
        for rest in (oldArray){
            if rest.id != restaurant.id{
                newArray.append(rest)
            }
        }
        let FavRests = saveController(restaurants:newArray)
        guard let FavRestsData = try? JSONEncoder().encode(FavRests) else {return}
        self.FavRestsData = FavRestsData
        }
    //-----------------------------------------FUNCTIONS-END
    var body: some View {
        VStack{
            Text(restaurant.name)
            Text(restaurant.description)
            Text(restaurant.telefon)
            Button(action: {
                let isFav = checkSaved()
                if isFav == false{
                    saveToController()
                } else {
                    deleteFromController()
                }
            }, label: {
                let isFav = checkSaved()
                if isFav == false{
                    Text("Add to Favorites")
                } else {
                    Text("Remove from Favorites")
                }
            })
        }
        
    }
}

//struct RestaurantView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestaurantView()
//    }
//}
