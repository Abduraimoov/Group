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
    
    func decode<T: Codable>(with data: Data, completion: (Result<T, Error>) -> Void) {
        do {
            let person = try decoder.decode(T.self, from: data)
            completion(.success(person))
        } catch let error {
            completion(.failure(error))
        }
    }
    
}
