//
//  ListDishesViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 25.06.2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    
  
    @IBOutlet weak var tblView: UITableView!
    
    var categories : DishCategory!
    
    var dishes :[Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
          

        title = categories.title
       
        tblView.dataSource = self
        tblView.delegate = self
        registerCells()
        
        ProgressHUD.show()
        NetworkManager.shared.fetchCategoryDishes(categoryId: categories.id ?? "") { [weak self] (result) in
            //table görünümü güncellenecek bu yuzden kendimize referans verirken weak self kullanmalıyız
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tblView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
        
    }
    
    private func registerCells(){
        tblView.register(UINib(nibName: DishListTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifer)
        
    }
}

extension ListDishesViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifer, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
