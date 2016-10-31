//
//  RestaurantMenuTableViewController.swift
//  DelishDish
//
//  Created by Winnie Wen on 10/18/16.
//  Copyright © 2016 wiwen. All rights reserved.
//

import UIKit

class RestaurantMenuTableViewController: UITableViewController {
    
    var restaurantName: String?
    let blackStar = "\u{2605}"
    
    
    var indexPath: IndexPath?
    
    
    //    var grandmaPrices = [["$5.00", "$5.00", "$6.75", "$1.50", "$4.50", "$5.75", "$1.50"], ["$8.00", "$8.00", "$8.00", "$8.00"], ["$13.00", "$13.00", "$11.00", "$8.00", "$8.00"]]
    
    let zoahMenu = ZoahMenu()
    let grandmaMenu = GrandMaMenu()
    let sushirittoMenu = Sushiritto()
    let projectJuiceMenu = ProjectJuiceMenu()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantName = restaurantName {
            self.title = restaurantName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if let restaurantName = restaurantName {
            if restaurantName == "Zoah Restaurant" {
                return self.zoahMenu.categories.count
            }
            else if restaurantName == "Grandma's" {
                return self.grandmaMenu.grandmaCategories.count
            }
            else if restaurantName == "Sushiritto" {
                return self.sushirittoMenu.sushirittoCatagories.count
            }
            else if restaurantName == "Project Juice" {
                return self.projectJuiceMenu.projectJuiceCatagories.count
            }
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // print("Categories: \(self.grandmaMenu[section].count)")
        
        if let restaurantName = restaurantName {
            if restaurantName == "Zoah Restaurant" {
                return self.zoahMenu.items[section].count
            }
            if restaurantName == "Grandma's" {
                return self.grandmaMenu.grandmaMenu[section].count
            }
            else if restaurantName == "Sushiritto" {
                return self.sushirittoMenu.sushirittoMenu[section].count
            }
            else if restaurantName == "Project Juice" {
                return self.projectJuiceMenu.projectJuiceMenu[section].count
            }
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let restaurantName = restaurantName {
            if restaurantName == "Zoah Restaurant" {
                return self.zoahMenu.categories[section]
            }
            if restaurantName == "Grandma's" {
                return self.grandmaMenu.grandmaCategories[section]
            }
            else if restaurantName == "Sushiritto" {
                return self.sushirittoMenu.sushirittoCatagories[section]
            }
            else if restaurantName == "Project Juice" {
                return self.projectJuiceMenu.projectJuiceCatagories[section]
            }
            
        }
        
        return ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantMenuTableViewCell
        
        cell.starsLabel?.text = self.blackStar + self.blackStar + self.blackStar + self.blackStar + self.blackStar
        
        cell.starsLabel.textColor = UIColor.yellow
        
        if let restaurantName = restaurantName {
            if restaurantName == "Zoah Restaurant" {
                cell.restaurantMenuItemLabel?.text = self.zoahMenu.items[indexPath.section][indexPath.row]
                
                return cell
            }
            if restaurantName == "Grandma's" {
                cell.restaurantMenuItemLabel?.text = self.grandmaMenu.grandmaMenu[indexPath.section][indexPath.row]
                return cell
            }
            else if restaurantName == "Sushiritto" {
                
                
                cell.restaurantMenuItemLabel?.text = self.sushirittoMenu.sushirittoMenu[indexPath.section][indexPath.row]
                cell.dishImage.image = UIImage(named: self.sushirittoMenu.pictures[indexPath.section][indexPath.row])
                return cell
            }
            else if restaurantName == "Project Juice" {
                cell.restaurantMenuItemLabel?.text = self.projectJuiceMenu.projectJuiceMenu[indexPath.section][indexPath.row]
                return cell
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            if segue.identifier == "reviewSegue" {
                let reviewTableViewController = segue.destination as! DishReviewsTableViewController
                reviewTableViewController.dishName = self.sushirittoMenu.sushirittoMenu[indexPath.section][indexPath.row]
                reviewTableViewController.picture = self.sushirittoMenu.pictures[indexPath.section][indexPath.row]
            }
        }
    }
    
    

    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
