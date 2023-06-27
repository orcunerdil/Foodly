//
//  Errors.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import Foundation

enum Errors: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response couldn't be decoded."
        case .unknownError:
            return "Unknown error."
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let error):
            return error
        }
    }
    
}
