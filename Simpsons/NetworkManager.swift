//
//  NetworkManager.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping([Quote]) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description") 
                return
            }
            
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                DispatchQueue.main.async {
                    completion(quotes)
                }
                
            } catch let error {
                print(error)
                
            }
        }.resume()
    }
}
