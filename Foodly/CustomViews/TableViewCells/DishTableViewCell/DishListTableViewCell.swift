//
//  DishListTableViewCell.swift
//  Foodly
//
//  Created by Orçun Erdil on 25.06.2023.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    
    static let identifer = String(describing: DishListTableViewCell.self)

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        imgView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        
    }
    
    func setup (order: Order) {
        imgView.kf.setImage(with: order.dish?.image?.asURL)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.name
    }
    
}
