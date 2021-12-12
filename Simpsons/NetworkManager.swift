//
//  NetworkManager.swift
//  Simpsons
//
//  Created by leila leila on 30/11/2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(Result<RickAndMorty, NetworkError>) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let rickAndMorty = try JSONDecoder().decode(RickAndMorty.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(rickAndMorty))
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}

func fetchCharacter(from url: String, completion: @escaping(Character) -> Void) {
    guard let url = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
        guard let data = data else {
            print(error?.localizedDescription ?? "no description")
            return
        }
        
        do {
            let result = try JSONDecoder().decode(Character.self, from: data)
            DispatchQueue.main.async {
                completion(result)
            }
        } catch let error {
            print(error)
        }
    }.resume()
}
