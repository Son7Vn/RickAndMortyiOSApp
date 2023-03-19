//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 08/03/2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    ///You can modifire rawValue of key throught a variable computed:
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknow"
        }
    }
}
