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
    
    func categories(
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
    
    func fetchProducts(
        by cotegoryName: String,
        completion: @escaping (Result<[Product],
                               Error>) -> Void) {
        let url = Constants.baseURL.appendingPathComponent("filter.php")
        var components = URLComponents(url: url,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = [.init(name: "c", value: cotegoryName)]
        guard let url = components?.url else { return }
        let reguest = URLRequest(url: url)
        URLSession.shared.dataTask(with: reguest) { data, response, error in
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
    
}

