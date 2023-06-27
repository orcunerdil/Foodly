//
//  DishLandscapeCollectionViewCell.swift
//  Foodly
//
//  Created by Orçun Erdil on 24.06.2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    static let identifer = String(describing: DishLandscapeCollectionViewCell.self)

    
    
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        dishImgView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        
    }
    
}
