//
//  ListOrdersViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 26.06.2023.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var orders : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCell()
        
        ProgressHUD.show()
     
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkManager.shared.fetchOrder() { [weak self] (result) in
            //table görünümü güncellenecek bu yuzden kendimize referans verirken weak self kullanmalıyız
            switch result {
                
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
            
        }
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

