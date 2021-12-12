//
//  PhotoCell.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with characters: Character?) {
        DispatchQueue.main.async {
            guard let url = characters?.image else { return }
            guard let imageURl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageURl) else { return }
            self.imageView.image = UIImage(data: imageData)
        }
    
        }
    }
