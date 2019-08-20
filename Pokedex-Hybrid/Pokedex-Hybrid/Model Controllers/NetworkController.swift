//
//  NetworkController.swift
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

// ABSTRACTION
// Rules for swift to work with ObjC:
// 1) Subclass NSObject
// 2) @ObjC for functions
// 3) No such thing as structs and enums.

/*
class NetworkController: NSObject {
    
    //MARK: Properties
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    @objc static func performRequest(for url: URL, httpMethod: String, urlParameters: [String : String]? = nil, body: Data? = nil, completion: ((Data?, Error?) -> Void)? = nil) {
        
        //Build URL
        let requestURL = self.url(byAdding: urlParameters, to: url)
        //let requestURL = url.appendingPathComponent(urlParameters)
        var request = URLRequest(url: requestURL)
        
        request.httpMethod = httpMethod
        request.httpBody = body
        
        // Create and run task
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        dataTask.resume()
    }
    
    
}
*/
