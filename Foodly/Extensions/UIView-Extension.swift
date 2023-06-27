//
//  UIView-Extension.swift
//  Foodly
//
//  Created by Orçun Erdil on 21.06.2023.
//

import UIKit

extension UIView {
    
    //Storyboard da cornerradius degerine erişebilmek için bunu kullanabiliriz.
    @IBInspectable var cornerRadius : CGFloat {
        get{return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

