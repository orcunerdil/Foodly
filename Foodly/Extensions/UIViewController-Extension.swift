//
//  UIViewController-Extension.swift
//  Foodly
//
//  Created by Orçun Erdil on 25.06.2023.
//

import UIKit

extension UIViewController {
    
    
    static var identifier :String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storybard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
    
    
}
