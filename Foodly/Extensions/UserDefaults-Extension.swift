//
//  UserDefaults-Extension.swift
//  Foodly
//
//  Created by Orçun Erdil on 29.06.2023.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys : String {
        case hasOnboarded
    }
    
    var hasOnboarded : Bool {
        get{
            bool(forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
    }
    
}
