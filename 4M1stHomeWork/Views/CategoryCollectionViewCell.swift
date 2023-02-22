//
//  CategoryCollectionViewCell.swift
//  4M1stHomeWork
//
//  Created by user on 3/2/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet private weak var categoryImages: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    func display(item: Category) {
        categoryImages.image = UIImage(named: item.imagesCategory)
        categoryLabel.text = item.name
        categoryLabel.textColor = .white
        categoryImages.layer.borderWidth = 3
        categoryImages.layer.borderColor = UIColor.orange.cgColor
    }
}


