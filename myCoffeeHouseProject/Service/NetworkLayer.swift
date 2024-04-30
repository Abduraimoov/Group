//
//  NetworkLayer.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/13/24.
//

import Foundation

struct NetworkLayer {
    
    private let authService = AuthService.shared
    
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
    
    func fetchMealDetails(
        by idMeal: String,
        completion: @escaping (
            Result<
            Meal,
            Error>) -> Void
    ) {
           let url = Constants.baseURL.appendingPathComponent("lookup.php")
           var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
           components?.queryItems = [.init(name: "i", value: idMeal)]
           guard let url = components?.url else { return }
           let reguest = URLRequest(url: url)
           URLSession.shared.dataTask(with: reguest) { data, _, error in
               if let error = error {
                   completion(.failure(error))
                   return
               }
               
               guard let data = data else {
                   completion(.failure(NSError(domain: "dataNilError", code: -1001, userInfo: nil)))
                   return
               }
               
               do {
                   let mealDetails = try JSONDecoder().decode(Meals.self, from: data)
                   if let firstMeal = mealDetails.meals.first {
                       completion(.success(firstMeal))
                   } else {
                       completion(.failure(NSError(domain: "noDataError", code: -1002, userInfo: nil)))
                   }
               } catch {
                   completion(.failure(error))
               }
           }.resume()
       }
}
