//
//  DishesCollectionViewController.swift
//  DelishDish
//
//  Created by Winnie Wen on 10/18/16.
//  Copyright © 2016 wiwen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DishesCollectionViewController: UICollectionViewController {

    let restaurants = ["Zoah Restaurant", "Grandma's", "Sushiritto", "Project Juice"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.restaurants.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DishesCollectionViewCell
        
        cell.restaurantNameLabel?.text = self.restaurants[indexPath.row]
        
        if indexPath.row == 0 {
            cell.dishImage.image = UIImage(named: "zaoh.jpg")
        }
        
        if indexPath.row == 1 {
            cell.dishImage.image = UIImage(named: "grandmas.jpg")
        }
        
        if indexPath.row == 3 {
            cell.dishImage.image = UIImage(named: "project.jpg")
        }
        if indexPath.row == 2 {
            cell.dishImage.image = UIImage(named: "sushirrito.jpg")
        }
    
        
        return cell
    }

    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Menu" {
     
            let menuViewController = segue.destination as! RestaurantMenuTableViewController
            
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView!.indexPath(for: cell)
            
            if let index = indexPath?.row {
                menuViewController.restaurantName = self.restaurants[index]
            }
            
            
        }
    }
}
