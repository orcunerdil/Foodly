//
//  AllDishes.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
