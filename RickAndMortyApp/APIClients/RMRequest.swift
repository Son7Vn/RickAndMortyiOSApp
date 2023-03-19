//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 08/03/2023.
//

import Foundation

///Object that represents a singlet API call 
final class RMRequest {
    /// Path components
    /// Query parameters
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    ///Desired endpoint
    private let endpoint: RMEndpoint
    
    ///Path components for API, if any
    private let pathComponents: [String]
    ///Query arguments for API, if any
    private let queryParameters: [URLQueryItem] 
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            ///name=value&name=value
            ///using compactMap(create new collection from a array)
            ///using .joined to return new string (connected together the element in array with an option <"&" in this case>). U can uses .split(separator: " ") to split original string into an array of substrings
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    //MARK: Public
    init(
        enpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = enpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(enpoint: .character)
}
