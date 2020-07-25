//
//  BlogsListViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class BlogsListViewModel: ObservableObject {
    
    @Published var blogs: [Blog] = []
    @Published var error: SimpleErrorMessage?
    
    private let provider: BlogsProvider
    
    init(provider: BlogsProvider) {
        self.provider = provider
        refresh()
    }
    
    func refresh() {
        self.provider.getBlogs { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let blogs):
                    self.blogs = blogs
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
}
