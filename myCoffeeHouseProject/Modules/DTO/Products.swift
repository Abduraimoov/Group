//
//  Products.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/13/24.
//

import Foundation

struct Products: Codable {
    
    let meals: [Product]

}

struct Product: Codable {
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
}
