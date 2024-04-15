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
        // MARK: - создаём запрос на сервер но не отправляем его (просто собираем данные) --> Get
        let request = URLRequest(url: Constants.baseURL)
        // MARK: - URLSession сессия которая позволяет отправить запрос "request" на сервер
        URLSession.shared.dataTask(with: request) { data, response, error in // --> получили дата (успех)
          // error --> ошибка, response --> по умольчанию всегда приходить
            if let error {
                // MARK: - проверяем ошибку на опцилнальность
                completion(.failure(error))
            }
            
            if let data {
                // MARK: - проверяем данные на опцилнальность
                do {
                    // MARK: - пытаемься распарсить данные
                    let model = try decoder.decode(Products.self,
                                                      from: data)
                    // MARK: - закидываем данные в замыкании
                    completion(.success(model.products))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume() // --> Отправь запрос на сервер 
    }
        
}
