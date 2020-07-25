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
    @Published var isLoadingMore: Bool = false
    
    private let provider: BlogsProvider
    
    private var pagination = Pagination()
    
    init(provider: BlogsProvider) {
        self.provider = provider
        loadData()
    }
    
    func loadData() {
        self.provider.getBlogs(pagination: pagination) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let blogs):
                    self.blogs.append(contentsOf: blogs)
                    self.pagination.offset += 1
                case .failure(let error):
                    self.error = error
                }
                self.isLoadingMore = false
            }
        }
    }
    
    func loadedBlog(at index: Int) {
        guard index == blogs.count - 1 else { return }
        isLoadingMore = true
        loadData()
    }
    
}
