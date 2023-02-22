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
    
    func fetchProducts() throws -> [Product] {
        let decoder = JSONDecoder()
        let product = try decoder.decode([Product].self, from: Data(productJSON.utf8))
        return product
    }
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
}

