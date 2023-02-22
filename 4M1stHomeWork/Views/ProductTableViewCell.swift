//
//  ProductTableViewCell.swift
//  4M1stHomeWork
//
//  Created by user on 4/2/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ProductTableViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var openClose: UILabel!
    @IBOutlet private weak var timeLable: UILabel!
    @IBOutlet private weak var rateLable: UILabel!
    @IBOutlet private weak var whereIs: UILabel!
    @IBOutlet private weak var deliveryLable: UILabel!
    @IBOutlet private weak var priceLable: UILabel!
    @IBOutlet private weak var distanceLable: UILabel!
    
        func display(item: Product) {
        productImageView.image = UIImage(named: item.image)
            nameLabel.text = item.name
            priceLable.text = item.price
            rateLable.text = item.rate
            whereIs.text = item.whereIsFromProduct
            openClose.text = item.openClose
            deliveryLable.text = item.delivery
            distanceLable.text = item.distance
            timeLable.text = item.time
    }
    
    
}





