//
//  Person.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import Foundation

struct Person: Codable {
    
    let productName: String
    let ProductDrink: String
    let productPrice: Int
    let productImage: String
    
}

let JSONProduct = """
{
    "productName": "Каупчино",
    "ProductDrink": "Кафейный напиток",
    "productPrice": 150,
    "productImage": "url"
}
"""




