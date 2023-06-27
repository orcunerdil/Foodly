//
//  OnboardingCollectionViewCell.swift
//  Foodly
//
//  Created by Orçun Erdil on 22.06.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: "OnboardingCollectionViewCell")
    
    
    @IBOutlet weak var sliderImgView: UIImageView!
    @IBOutlet weak var sliderTitleLbl: UILabel!
    @IBOutlet weak var sliderDescriptionLbl: UILabel!
    
    
    func sliderSetup (_ slide:OnboardingSlide) {
        sliderImgView.image = slide.image
        sliderTitleLbl.text = slide.title
        sliderDescriptionLbl.text = slide.description
    }
    
}
