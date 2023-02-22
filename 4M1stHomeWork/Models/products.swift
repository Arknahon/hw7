//
//  products.swift
//  4M1stHomeWork
//
//  Created by user on 21/2/23.
//

import Foundation

let productJSON = """
[{ "image": "Burger Craze",
   "name": "Burger Craze",
   "time": "15-20",
   "price": "minimum 10$",
   "openClose": "Open",
   "whereIsFromProduct": "American & Burger",
   "delivery": "Free",
   "rate": "4.6(601)",
   "distance": "1.5 km "
},
{
   "image": "Italian Pizza",
   "name": "Italian Pizza",
   "time": "15-20",
   "price": "minimum 10$",
   "openClose": "Open",
   "whereIsFromProduct": "Italian & Burger",
   "delivery": "Free",
   "rate": "4.6(601)",
   "distance": "1.5 km "
}
]
"""

struct Product: Decodable {
    var image: String
    var name: String
    var time: String
    var price: String
    var openClose: String
    var whereIsFromProduct: String
    var delivery: String
    var rate: String
    var distance: String
}
