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
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var productArray: [Product] = []
    private var categoryArray: [Category] = []
    private var orderType: [TypeOfOrder] = []
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategoryCV()
        fetchCategory()
        fetchOrderType()
        fetchProducts()
        
    }
    private func fetchProducts () {
         isLoading = true
        NetworkLayer.shared.fetchProducts { result in
            self.isLoading = false
            switch result {
            case .success(let model):
                self.productArray = model
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case.failure(let error):
                self.showError(with: error)
            }
            
        }
    }
    private func searchProducts(by word: String) {
        isLoading = true
        NetworkLayer.shared.searchProducts(by: word) { result in
            self.isLoading = false
            switch result {
            case.success(let model):
                self.productArray = model
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                self.showError(with: error)
            }
        }
    }
    private func showError(with message: Error) {
        let alert = UIAlertController(title: "Error", message: message.localizedDescription, preferredStyle: .alert)
        alert.addAction(.init(title: "okay", style: .cancel))
        present(alert, animated: true)
    }
    private func fetchCategory() {
        do { categoryArray = try NetworkLayer.shared.fetchCategory()
            categoryCollectionView.reloadData()
        } catch {
            print("error \(error.localizedDescription)")
        }
    }
    private func fetchOrderType() {
        do { orderType = try NetworkLayer.shared.fetchOrderType()
            typeOfOrderCollectionView.reloadData()
        } catch {
            print("error \(error.localizedDescription)")
        }
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

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !isLoading {
            searchProducts(by: searchText)
        }
    }
}
