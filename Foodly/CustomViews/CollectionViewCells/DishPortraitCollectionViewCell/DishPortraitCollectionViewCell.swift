//
//  DishPortraitCollectionViewCell.swift
//  Foodly
//
//  Created by Orçun Erdil on 22.06.2023.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifer = "DishPortraitCollectionViewCell"

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImgView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish){
        titleLbl.text = dish.name
        dishImgView.kf.setImage(with: dish.image?.asURL)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
      
    }
    
}
