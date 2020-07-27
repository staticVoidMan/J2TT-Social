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
        
        APIResource<[User]>(url: url).request { (result) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(SimpleErrorMessage(message: error.localizedDescription)))
            }
        }
    }
}
