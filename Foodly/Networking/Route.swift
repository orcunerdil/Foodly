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
    
    var description: String{
        switch self {
        case .fethAllCategories:
            return "/dish-categories"
        }
    }
}
