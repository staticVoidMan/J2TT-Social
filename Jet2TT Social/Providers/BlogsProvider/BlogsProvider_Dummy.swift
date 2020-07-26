//
//  BlogsProvider_Dummy.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

struct BlogsProvider_DummyPass: BlogsProvider {
    func getBlogs(pagination: Pagination, completion: @escaping BlogsProviderCompletionHandler) {
        let blogs = [Blog.dummyBlogWithMedia, Blog.dummyBlogWithoutMedia]
        completion(.success(blogs))
    }
}
