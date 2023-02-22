//
//  OrderType.swift
//  4M1stHomeWork
//
//  Created by user on 21/2/23.
//

import UIKit

let orderTypeJSON = """
[{
    "orderOfType": "Delivery"
},
{
      "orderOfType": "Pick Up"

},
{
      "orderOfType": "Catering"
},
{
       "orderOfType": "Carbside"
}
]
"""

struct TypeOfOrder:Decodable {
    let orderOfType: String
}

