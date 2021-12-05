//
//  PhotoCell.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with quotes: Quote?) {
        DispatchQueue.global().async {
            guard let url = quotes?.imageUrl else { return }
            guard let imageURl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageURl) else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
        
    }
}
