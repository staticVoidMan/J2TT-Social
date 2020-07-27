//
//  BlogsProvider_API.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class BlogsProvider_API: BlogsProvider {
    func getBlogs(pagination: Pagination, completion: @escaping BlogsProviderCompletionHandler) {
        guard let url = URL(string: "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=\(pagination.offset)&limit=\(pagination.limit)")
            else { completion(.failure(SimpleErrorMessage(message: "Invalid URL"))); return }
            
            APIResource<[Blog]>(url: url).request { (result) in
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(SimpleErrorMessage(message: error.localizedDescription)))
                }
            }
    }
}
