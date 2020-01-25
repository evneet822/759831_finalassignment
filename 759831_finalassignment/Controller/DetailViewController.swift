//
//  DetailViewController.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var savelbl: UIButton!
    @IBOutlet weak var idfeild: UITextField!
    @IBOutlet weak var namefeild: UITextField!
    @IBOutlet weak var pricefeild: UITextField!
    @IBOutlet weak var descriptionfeild: UITextView!
    var currindx = -1
    var objectselected = false
    var slectedproduct: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
        
        if objectselected{
            namefeild.text = slectedproduct?.name
            pricefeild.text = "\(slectedproduct?.price ?? 0)"
            descriptionfeild.text = slectedproduct?.desc
            idfeild.text = "\(slectedproduct?.id ?? 0)"
            savelbl.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func save(_ sender: UIButton) {
        
        let name = namefeild.text
        let price = Double(pricefeild.text ?? "0") ?? 0
        let id = Int(idfeild.text ?? "0") ?? 0
        let desc = descriptionfeild.text
        
        Products.productsData.append(Products(name: name!, desc: desc!, price: price, id: id))
        namefeild.text = ""
        idfeild.text = ""
        pricefeild.text = ""
        descriptionfeild.text = ""
    }
}
