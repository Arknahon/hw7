//
//  OrderTypeCollectionViewCell.swift
//  4M1stHomeWork
//
//  Created by user on 4/2/23.
//

import UIKit

class OrderTypeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifierForOrderType = String(describing: TypeOfOrder.self)
    
    @IBOutlet private weak var typeOfOrderLable: UILabel!
    
    func display(item: TypeOfOrder) {
        typeOfOrderLable.text = item.orderOfType
        typeOfOrderLable.layer.borderColor = UIColor.lightGray.cgColor
        typeOfOrderLable.layer.borderWidth = 2
        
//        typeOfOrderLable.textColor = item.colorForText
    }
}

