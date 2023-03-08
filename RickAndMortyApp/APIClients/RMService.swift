//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 08/03/2023.
//

import UIKit

//Primary API service object to get Rick and Morty data
final class RMService {
    
    //Shared singleton instance
    static let shared = RMService()
    //Private contructor
    private init() {}
    
    public func excute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
