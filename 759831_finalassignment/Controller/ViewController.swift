//
//  ViewController.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var products = [Products]()
    var contextV : NSManagedObjectContext?
    var loadedData : [Products]?
    
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var idtxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    @IBOutlet weak var desctxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let p1 = Products(name: "Product 1", desc: "product 1 description", price: 2055.0, id: 1)
        let p2 = Products(name: "Product 2", desc: "product 2 description", price: 465.0, id: 2)
        let p3 = Products(name: "Product 3", desc: "product 3 description", price: 20.0, id: 3)
        let p4 = Products(name: "Product 4", desc: "product 4 description", price: 55.0, id: 4)
        let p5 = Products(name: "Product 5", desc: "product 5 description", price: 55.0, id: 5)
        let p6 = Products(name: "Product 6", desc: "product 6 description", price: 205.0, id: 6)
        let p7 = Products(name: "Product 7", desc: "product 7 description", price: 455.0, id: 7)
        let p8 = Products(name: "Product 8", desc: "product 8 description", price: 655.0, id: 8)
        let p9 = Products(name: "Product 9", desc: "product 9 description", price: 27.0, id: 9)
        let p10 = Products(name: "Product 10", desc: "product 10 description", price: 35.0, id: 10)
        
        products = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10]
        
        
        for p in products{
            Products.productsData.append(p)
        }

        nametxt.text = p1.name
        idtxt.text = "\(p1.id)"
        priceTxt.text = "\(p1.price)"
        desctxt.text = "\(p1.desc)"
        
//        clearCoreData()
        
        loadata()

         NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.willResignActiveNotification, object: nil)
        
        
    }
    
    @objc func saveData() {
        
        clearCoreData()
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appdelegate.persistentContainer.viewContext
        contextV = context
        
        for p in products{
            let entity = NSEntityDescription.insertNewObject(forEntityName: "ProductEntity", into: context)
            entity.setValue(p.name, forKey: "name")
            entity.setValue(p.desc, forKey: "desc")
            entity.setValue(p.id, forKey: "id")
            entity.setValue(p.price, forKey: "price")
        }
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProductTableViewController{
            destination.productData = loadedData
        }
    }
    
    func loadata() {
        
        Products.productsData = []
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appdelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
        
        do{
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject]{
                let name = result.value(forKey: "name") as! String
                let desc = result.value(forKey: "desc") as! String
                let price = result.value(forKey: "price") as! Double
                let id = result.value(forKey: "id") as! Int
                
                Products.productsData.append(Products(name: name, desc: desc, price: price, id: id))
            }
        }catch{
            print(error)
        }
    }
   
    
    func clearCoreData() {
           // create an instance of app delegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           // second step is context
           let context = appDelegate.persistentContainer.viewContext
           // create a fetch request
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
           
           fetchRequest.returnsObjectsAsFaults = false
           
           do {
               let results = try context.fetch(fetchRequest)
               for managedObjects in results {
                   if let managedObjectData = managedObjects as? NSManagedObject {
                       context.delete(managedObjectData)
                   }
               }
           } catch {
               print(error)
           }
           
       }


}

