//
//  PhotoCell.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with quote: Quote) {
        imageView.image = quote.image
}
