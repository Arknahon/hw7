//
//  Extension + ImageView.swift
//  4M1stHomeWork
//
//  Created by user on 22/2/23.
//

import UIKit

extension UIImageView {
    func getImage(from path: String) {
        guard let url = URL(string: path) else { return }
        Task {
            let (data, _) = try await URLSession.shared.data(from: url)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        
    }
}
