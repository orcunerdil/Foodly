//
//  String-Extension.swift
//  Foodly
//
//  Created by Orçun Erdil on 22.06.2023.
//

import Foundation

extension String {
    var asURL : URL? {
        return URL(string: self)
    }
}
