//
//  ProductTableViewController.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController{
    
    
   @IBOutlet weak var searchbar: UISearchBar!
    var productData = [Products]()
//    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        searchController.searchResultsUpdater = self
//               searchController.dimsBackgroundDuringPresentation = false
//               definesPresentationContext = true
//               tableView.tableHeaderView = searchController.searchBar
//        searchBar.backgroundColor = UIColor.white
        
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        definesPresentationContext = true
//        tableView.tableHeaderView
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productData.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "productCell"){
            cell.textLabel?.text = productData[indexPath.row].name
            return cell

            // Configure the cell...
    }
    return UITableViewCell()
    }
    
    
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
////           self.searchBar.showsCancelButton = true
//        self.searchbar.showsCancelButton = true
//       }
//
//
//        func updateSearchResults(for searchController: UISearchController) {
//            filter(for: searchController.searchBar.text!)
//        }
//
//       func updateSearchResults(for searchController: UISearchController) {
//           filterStudent(for: searchController.searchBar.text ?? "")
//       }
    
    
    
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//     func filter(for searchText: String){
//
//        filterData = Products.productsData.filter({ (product) -> Bool in
//            product.name.lowercased().contains(searchText.lowercased())
//        })
//        tableView.reloadData()
        
//        filterData = Student.studentData.filter({ (Student) -> Bool in
//            Student.firstName.lowercased().contains(searchText.lowercased())
//        })
//        tableView.reloadData()
        
    
func loadCoreData() {
     let appdelegate = UIApplication.shared.delegate as! AppDelegate
           let context  = appdelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
    
    do {
        let results = try context.fetch(fetchRequest)
        if results is [NSManagedObject] {
            for result in results as! [NSManagedObject] {
                let name = result.value(forKey: "name") as! String
                let price = result.value(forKey: "price") as! Double
                let id = result.value(forKey: "id") as! Int
                let desc = result.value(forKey: "desc") as! String
                
                productData.append(Products(name: name, desc: desc, price: price, id: id))
            }
        }
    } catch {
        print(error)
    }
}


}

