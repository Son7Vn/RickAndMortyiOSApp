//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 15/03/2023.
//

import UIKit

final class RMCharacterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageURL: URL?
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageURL: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
     
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        //ToDO: Abstract to Image Manager
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
//            print("Data from http url image: \(data)")
            completion(.success(data))
        }
        task.resume()
    }
    
}
