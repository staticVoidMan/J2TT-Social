//
//  UsersProvider_API.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class UsersProvider_API: UsersProvider {
    func getUsers(completion: @escaping UsersProviderCompletionHandler) {
        guard let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/users")
            else { completion(.failure(SimpleErrorMessage(message: "Invalid URL"))); return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(SimpleErrorMessage(message: error.localizedDescription)))
                return
            }
            
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(SimpleErrorMessage(message: error.localizedDescription)))
                }
            } else {
                completion(.failure(SimpleErrorMessage(message: "Data unavailable")))
            }
        }
        .resume()
    }
}
