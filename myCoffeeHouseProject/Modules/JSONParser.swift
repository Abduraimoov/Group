//
//  JSONParser.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/11/24.
//

import Foundation

struct JSONParser {
    
    let decoder = JSONDecoder() // -> json -> struct
    
    let encoder = JSONEncoder() // -> struct -> json
    
    func decode(with data: Data, completion: (Person?, Error?) -> Void) {
        do {
           let person = try decoder.decode(Person.self, from: data)
            completion(person, nil)
        } catch let error {
            print(error.localizedDescription)
            completion(nil, error)
        }
    }
}
