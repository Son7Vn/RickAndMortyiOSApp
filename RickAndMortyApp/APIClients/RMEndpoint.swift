//
//  RMEndpoint.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 08/03/2023.
//

import Foundation
///Represents unique API endpoint
@frozen  enum RMEndpoint: String {
    ///endpoint to get character infor
    case character
    ///endpoint to get location infor
    case location
    ///endpoint to get episode inf or
    case episode
}
