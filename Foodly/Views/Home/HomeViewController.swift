//
//  HomeViewController.swift
//  Foodly
//
//  Created by Orçun Erdil on 22.06.2023.
//

import UIKit
import ProgressHUD


class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
  
    var categories : [DishCategory] = []
    var popularDish : [Dish] = []
    var specials : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        registerCells()
   
        ProgressHUD.show()
        NetworkManager.shared.fetchAllCategories { [weak self] (result) in
            switch result
            {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.popularDish = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifer)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifer)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifer)
        
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDish.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifer, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell

        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifer, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: popularDish[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifer, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.categories = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDish[indexPath.row] :specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}
