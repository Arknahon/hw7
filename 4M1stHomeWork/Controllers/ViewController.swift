//
//  ViewController.swift
//  4M1stHomeWork
//
//  Created by user on 27/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var typeOfOrderCollectionView: UICollectionView!
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
    
    var productArray: [Product] = [
        Product(image: "Burger Craze",
                name: "Burger Craze",
                time: "15 - 20 min",
                price: "minimum 10$",
                openClose: "open",
                whereIsFromProduct: "American & Burgers",
                delivery: "Free",
                rate: "4.6(601)",
                distance: "1.5 km away"
               ),
        Product(image: "Italian Pizza",
                name: "Italian Pizza",
                time: "15 - 20 min",
                price: "minimum 10$",
                openClose: "open",
                whereIsFromProduct: "Italian & Burgers",
                delivery: "Free",
                rate: "4.6(600)",
                distance: "1.5 km away"),
    ]
    
    private let categoryArray: [Category] = [
        Category(imagesCategory: "Take Aways",
                 name: "Takeaways"),
        Category(imagesCategory: "Grocery" ,
                 name: "Grocery"),
        Category(imagesCategory: "Convience",
                 name: "Convenience"),
        Category(imagesCategory: "Pharmacy ",
                 name: "Pharmacy")
    ]
    
    private let orderType: [TypeOfOrder] = [
        TypeOfOrder(orderOfType: "Delivery",
                    colorForText: .white, backGroundColorForText: .orange),
        TypeOfOrder(orderOfType: "Pick Up",
                    colorForText: .systemGreen, backGroundColorForText: .white),
        TypeOfOrder(orderOfType: "Catering",
                    colorForText: .systemGreen, backGroundColorForText: .white),
        TypeOfOrder(orderOfType: "Carbside",
                    colorForText: .systemGreen, backGroundColorForText: .white)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategoryCV()
    }
    
    private func configureCategoryCV() {
        productTableView.dataSource = self
        productTableView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        typeOfOrderCollectionView.dataSource = self
        typeOfOrderCollectionView.delegate = self
        productTableView.register(UINib(nibName:   String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
        typeOfOrderCollectionView.register(
            UINib(
                nibName: String(describing:
                OrderTypeCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier:
                OrderTypeCollectionViewCell.reuseIdentifierForOrderType
        )
        categoryCollectionView.register(
            UINib(
                nibName: String(describing:
                CategoryCollectionViewCell.self),
                bundle: nil
            ),
            forCellWithReuseIdentifier:
            CategoryCollectionViewCell.reuseIdentifier
        )
       
        typeOfOrderCollectionView.showsVerticalScrollIndicator = false
        typeOfOrderCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        productTableView.showsVerticalScrollIndicator = false
        productTableView.showsHorizontalScrollIndicator = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! ProductTableViewCell
        let model = productArray[indexPath.row]
        cell.display(item: model)
        print("cell created")
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 350
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == categoryCollectionView {
            return categoryArray.count
        }
        if collectionView == typeOfOrderCollectionView {
        }
        return orderType.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:
                CategoryCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! CategoryCollectionViewCell
            let model = categoryArray[indexPath.row]
            cell.display(item: model)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:
                    OrderTypeCollectionViewCell.reuseIdentifierForOrderType,
                for: indexPath
            ) as! OrderTypeCollectionViewCell
            let model = orderType[indexPath.row]
            cell.backgroundColor = orderType[0].backGroundColorForText
            cell.backgroundColor = orderType[indexPath.row].backGroundColorForText
            cell.display(item: model)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 80, height: 105)
        } else {
            return CGSize(width: 105, height: 80)
        }
      
    }
}

extension ViewController: ProductsCellDelegete {
    func didSelectionItems(item : Product) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
