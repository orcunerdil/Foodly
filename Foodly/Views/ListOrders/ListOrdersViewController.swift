//
//  ListOrdersViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var orders : [Order] = [
        .init(id: "id", name: "Orcun Erdil", dish:
                .init(id: "id1", name: "Mantı", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 1121)),
        .init(id: "id", name: "Haydar Er", dish:
                .init(id: "id1", name: "Turşu", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 1121)),
        .init(id: "id", name: "Müslüm Erdil", dish:
                .init(id: "id1", name: "Keşkek", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 1121)),
        .init(id: "id", name: "Ali Erdil", dish:
                .init(id: "id1", name: "Külbastı", image: "https://picsum.photos/100/200", description: "This is the best I ever tasted", calories: 1121))
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCell()
    }
    
    private func registerCell(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifer)
    }
    


}

extension ListOrdersViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifer, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
        controller.dish = orders[indexPath.row].dish
    }
    
}

