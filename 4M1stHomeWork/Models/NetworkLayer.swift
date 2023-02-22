//
//  NetworkLayer.swift
//  4M1stHomeWork
//
//  Created by user on 22/2/23.
//

import Foundation

final class NetworkLayer {
    
    static let shared = NetworkLayer()
    
    private init () { }
    
    private var baseURL = URL(string: "https://dummyjson.com/products")!
    func fetchCategory() throws -> [Category] {
        let decoder = JSONDecoder()
        let category = try decoder.decode([Category].self, from: Data(categoryJSON.utf8))
        return category
    }
    func fetchOrderType() throws -> [TypeOfOrder] {
        let decoder = JSONDecoder()
        let orderType = try decoder.decode([TypeOfOrder].self, from: Data(orderTypeJSON.utf8))
        return orderType
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let request = URLRequest(url: baseURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                let model: Products = self.decode(with: data)
                completion(.success(model.products))
            }
        }
        .resume()
    }
    
    func searchProducts(by word: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        let url = baseURL.appendingPathComponent("search")
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [.init(name: "q", value: word)]
        if let url = urlComponents?.url {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    let model: Products = self.decode(with: data)
                    completion(.success(model.products))
                }
            }
            .resume()
        }
    }
    
//https://dummyjson.com/posts/search?q=love
    
    func decode<T: Decodable>(with data: Data) -> T {
        try! JSONDecoder().decode(T.self, from: data)
    }
}

    

