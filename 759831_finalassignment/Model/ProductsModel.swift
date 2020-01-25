//
//  ProductsModel.swift
//  759831_finalassignment
//
//  Created by Evneet kaur on 2020-01-24.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import Foundation

class Products{
    internal init(name: String, desc: String, price: Double, id: Int) {
        self.name = name
        self.desc = desc
        self.price = price
        self.id = id
    }
    
  
    
    var name : String
    var desc: String
    var price: Double
    var id : Int
    
    
    
    
    
    static var productsData =  [Products]()
}
