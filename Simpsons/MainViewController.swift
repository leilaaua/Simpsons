//
//  MainViewController.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    let url = "https://thesimpsonsquoteapi.glitch.me/quotes?count=4"

    private var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchData(from: url) { quote in
            self.quote?.image = quote.image
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
    
        return cell
    }

    // MARK: UICollectionViewDelegate


}
