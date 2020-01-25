//
//  ProductTableViewController.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController,UISearchResultsUpdating{
    
    
    
    
//   @IBOutlet weak var searchbar: UISearchBar!
    var contextVC : NSManagedObjectContext?
    var filterData : [Products] = []
//    var isfiltering = true
   let searchController = UISearchController(searchResultsController: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
        
        
       searchController.searchResultsUpdater = self
       // 2
       searchController.obscuresBackgroundDuringPresentation = false
       // 3
       searchController.searchBar.placeholder = "products"
       // 4
       navigationItem.searchController = searchController
       // 5
       definesPresentationContext = true
//        var isSearchBarEmpty: Bool {
//             return searchController.searchBar.text?.isEmpty ?? true
//           }

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive {
            return filterData.count
        }else{
        
        return Products.productsData.count
        }
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "productCell"){
            let p : Products
            if searchController.isActive{
                p = filterData[indexPath.row]
            }else{
                p = Products.productsData[indexPath.row]
            }
            cell.textLabel?.text = p.name
            
            return cell

            // Configure the cell...
    }
    return UITableViewCell()
    }
    

    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filteproducts(searchBar.text!)
    }
    
    


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? DetailViewController{
            if let cell = sender as? UITableViewCell{
                let index = tableView.indexPath(for: cell)?.row
                let pd : Products
                if searchController.isActive{
                    pd = filterData[index!]
                }else{
                    pd = Products.productsData[index!]
                }
                destination.slectedproduct = pd
                
            }
        }
    }


        
//    func filterContentForSearchText(_ searchText: String,
//                                    category: Candy.Category? = nil) {
//      filteredCandies = candies.filter { (candy: Candy) -> Bool in
//        return candy.name.lowercased().contains(searchText.lowercased())
//      }
//
//      tableView.reloadData()
//    }
    
    func filteproducts(_ searchText : String){
        filterData = Products.productsData.filter({ (product: Products) -> Bool in
            return product.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()

    }




}

