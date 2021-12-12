//
//  MainViewController.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    // MARK: - Private Properties
    private var rickAndMorty: RickAndMorty?
    private var characters: [Character] = []
    private let spacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(with: Link.rickAndMortyApi.rawValue)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    private func fetchData(with url: String?) {
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
                
            case .success(let rickAndMorty):
                self.rickAndMorty = rickAndMorty
                self.characters = rickAndMorty.results
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        
        let characters = characters[indexPath.item]
        
        cell.configure(with: characters)
        
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
