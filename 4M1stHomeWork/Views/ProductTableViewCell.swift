//
//  ProductTableViewCell.swift
//  4M1stHomeWork
//
//  Created by user on 4/2/23.
//

import UIKit

protocol ProductsCellDelegete: AnyObject {
    func didSelectionItems(item: Product)
}


class ProductTableViewCell: UITableViewCell, ProductsCellDelegete {
    func didSelectionItems(item: Product) {
        print("f")
    }
    
    
    static let reuseIdentifier = String(describing: ProductTableViewCell.self)
    
    @IBOutlet private weak var productImageView: UIImageView! {
        didSet {
            productImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnImage))
            productImageView.addGestureRecognizer(tap)
        }
    }
 
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var openClose: UILabel!
    @IBOutlet private weak var timeLable: UILabel!
    @IBOutlet private weak var rateLable: UILabel!
    @IBOutlet private weak var whereIs: UILabel!
    @IBOutlet private weak var deliveryLable: UILabel!
    @IBOutlet private weak var priceLable: UILabel!
    @IBOutlet private weak var distanceLable: UILabel!
    
    weak var delegate: ProductTableViewCell?
    private var products: Product?
        func display(item: Product) {
            products = item
            productImageView.getImage(from: item.thumbnail)
            nameLabel.text = item.title
            priceLable.text = "\(item.price)"
            rateLable.text = "\(item.rating)"
            whereIs.text = item.description
            openClose.text = "\(item.discountPercentage)"
            deliveryLable.text = "\(item.stock)"
            distanceLable.text = item.brand
            timeLable.text = item.category
    }
    @objc
    private func didTapOnImage() {
        guard let  products = products else {
            return
        }
        delegate?.didSelectionItems(item: products)
        
    }
    
}





