//
//  products.swift
//  4M1stHomeWork
//
//  Created by user on 21/2/23.
//

import Foundation



struct Product: Decodable {
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
}

struct Products: Decodable {
    var products: [Product]
}

