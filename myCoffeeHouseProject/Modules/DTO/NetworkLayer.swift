//
//  NetworkLayer.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/13/24.
//

import Foundation

struct NetworkLayer {
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    func fetchProducts(completion: @escaping (Result<[Product],
                                              Error>) -> Void) {
        let request = URLRequest(url: Constants.baseURL)
        URLSession.shared.dataTask(with: request) { data, response, error in
            // data --> Succes (200>)
            // error --> Failure (100, 300, 400, 500)
            // response --> default
            
            if let error {
                completion(.failure(error))
            }
            // распарсить json в структуры
            if let data {
                do {
                    let model = try decoder.decode(Products.self,
                                                      from: data)
                    completion(.success(model.products))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
        
}
