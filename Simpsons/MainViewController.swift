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
    var quotes: [Quote] = []
    
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

