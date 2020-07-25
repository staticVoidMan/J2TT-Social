//
//  BlogsProvider.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

typealias BlogsProviderResult = Result<[Blog],SimpleErrorMessage>
typealias BlogsProviderCompletionHandler = (BlogsProviderResult) -> Void

protocol BlogsProvider {
    func getBlogs(pagination: Pagination, completion: @escaping BlogsProviderCompletionHandler)
}
