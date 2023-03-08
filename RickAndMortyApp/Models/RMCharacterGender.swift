//
//  RMCharacterGender.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 08/03/2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // ('Female', 'Male', 'Gederless' or 'unknown')
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
