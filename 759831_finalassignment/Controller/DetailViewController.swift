//
//  DetailViewController.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var idfeild: UITextField!
    @IBOutlet weak var namefeild: UITextField!
    @IBOutlet weak var pricefeild: UITextField!
    @IBOutlet weak var descriptionfeild: UITextView!
    var currindx = -1
    var slectedproduct: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let p = Products.productsData[currindx]
//
//        namefeild.text = p.name
//        pricefeild.text = "\(p.price)"
//        descriptionfeild.text = p.desc
//        idfeild.text = "\(p.id)"
        namefeild.text = slectedproduct?.name
        pricefeild.text = "\(String(describing: slectedproduct?.price))"
        descriptionfeild.text = slectedproduct?.desc
        idfeild.text = "\(String(describing: slectedproduct?.id))"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
