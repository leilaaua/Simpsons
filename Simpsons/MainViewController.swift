//
//  MainViewController.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private let url = "https://thesimpsonsquoteapi.glitch.me/quotes?count=10"
    private var quote: Quote?
    private var quotes: [Quote] = []
    private let spacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(with: url)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    private func fetchData(with url: String?) {
        NetworkManager.shared.fetchData(from: url) { quotes in
            self.quotes = quotes
            self.collectionView.reloadData()
        }
    }
    
//    private func sortedQuotes(with quotes: [Quote]) -> [Quote] {
//
//        var quotes: [Quote] = []
//        var index = 0
//
//        }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        quotes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        
        let quotes = quotes[indexPath.item]
        
        cell.configure(with: quotes)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
     
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 2
        let paddingWitdth = 20 * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWitdth
        let widthPerItem = availableWidth / itemPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        spacing
    }
    
}
