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
    
    func fetchProducts(
        completion: @escaping (Result<[Product],
                               Error>) -> Void) {
        let reguest = URLRequest(url: Constants.baseURL)
        URLSession.shared.dataTask(with: reguest) { data,
            response,
            error in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                do {
                    let model = try decoder.decode(Products.self,
                                                   from: data)
                    completion(.success(model.meals))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func createProduct(
        completion: @escaping (Result<[Category],
                               Error>) -> Void) {
        let reguest = URLRequest(url: Constants.categoriesURl)
        URLSession.shared.dataTask(with: reguest) { data,
            response,
            error in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                do {
                    let model = try decoder.decode(Categories.self,
                                                   from: data)
                    completion(.success(model.categories))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
}

