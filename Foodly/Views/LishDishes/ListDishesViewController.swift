//
//  ListDishesViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 25.06.2023.
//

import UIKit

class ListDishesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var categories : DishCategory!
    
    var dishes :[Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", description: "This is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tastedThis is the best I ever tasted", calories: 11),
        .init(id: "id1", name: "Makarna", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 1121),
        .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 141)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        title = categories.title
        
        tableView.dataSource = self
        tableView.delegate = self
        registerCells()
    }
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifer)
        
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
