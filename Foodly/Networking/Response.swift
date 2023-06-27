//
//  Response.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import Foundation

struct Response<T: Codable>: Codable {
    let status : Int
    let message: String?
    let data : T?
    let error : String?
}
