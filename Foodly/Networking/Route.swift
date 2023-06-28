//
//  Route.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import Foundation

enum Route {
    
    static let baseURL = "https://yummie.glitch.me"
    
    case fethAllCategories
    case placeOrder(String)
    case fetchCategoriDishes(String)
    case fetchOrders
    
    var description: String{
        switch self {
        case .fethAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoriDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
        }
    }
}
