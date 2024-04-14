//
//  Products.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/13/24.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

struct Product: Codable {
    let image: String
    let title: String
    let description: String
    let price: String
}
