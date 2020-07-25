//
//  UsersProvider.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

typealias UsersProviderResult = Result<[User],SimpleErrorMessage>
typealias UsersProviderCompletionHandler = (UsersProviderResult) -> Void

protocol UsersProvider {
    func getUsers(completion: @escaping UsersProviderCompletionHandler)
}
