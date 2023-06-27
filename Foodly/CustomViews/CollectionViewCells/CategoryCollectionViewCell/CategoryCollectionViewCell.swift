//
//  CategoryCollectionViewCell.swift
//  Foodly
//
//  Created by Orçun Erdil on 22.06.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifer = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImgView: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    func setup(category: DishCategory){
        categoryLbl.text = category.title
        categoryImgView.kf.setImage(with: category.image?.asURL)
    }
    
}
