//
//  APIResource.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 27/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case requestFailed(error: Error)
    case decodingFailed(error: Error)
    case noData
}

struct APIResource<T: Decodable> {
    
    let url: URL
    
    func request(completion: @escaping (Result<T,RequestError>)->Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed(error: error)))
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(.iso8601Full)
                    
                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingFailed(error: error)))
                }
            } else {
                completion(.failure(.noData))
            }
        }
        .resume()
    }
    
}
