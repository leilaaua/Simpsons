//
//  RickAndMorty.swift
//  Simpsons
//
//  Created by leila leila on 08/12/2021.
//

import Foundation

struct RickAndMorty: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Species: \(species)
    Gender: \(gender)
    """
    }
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}
