//
//  Category.swift
//  4M1stHomeWork
//
//  Created by user on 21/2/23.
//

import Foundation

let categoryJSON = """
[{
     "imagesCategory": "Take Aways",
     "name": "Take Aways"
},
{
     "imagesCategory": "Pharmacy",
     "name": "Pharmacy"


},
{
       "imagesCategory": "Grocery",
       "name": "Grocery"
},
{
       "imagesCategory": "Convience",
       "name": "Convience"
}
]
"""

struct Category:Decodable {
    let imagesCategory: String
    let name: String
}
