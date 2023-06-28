//
//  DishDetailViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 24.06.2023.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet weak var dishImg: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishTitle: UILabel!
    
    var dish : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    
    private func populateView(){
        dishImg.kf.setImage(with: dish.image?.asURL)
        dishTitle.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        print(dish.description)
    }
    @IBAction func orderActionBtn(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter a name for order")
            return
        }
        ProgressHUD.show("Placing order...")
        NetworkManager.shared.placeOrder(dishId: dish.id ?? "" , name: name) {
            (results) in
            switch results {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
 
}
