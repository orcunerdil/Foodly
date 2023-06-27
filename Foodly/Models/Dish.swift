//
//  Dish.swift
//  Foodly
//
//  Created by Orçun Erdil on 23.06.2023.
//

import Foundation

struct Dish : Codable {
    let id, name, image, description : String?
    let calories : Int?
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
