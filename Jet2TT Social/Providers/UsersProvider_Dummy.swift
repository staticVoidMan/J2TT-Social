//
//  UsersProvider_Dummy.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

class UsersProvider_DummyFailure: UsersProvider {
    func getUsers(completion: @escaping UsersProviderCompletionHandler) {
        let result: UsersProviderResult = .failure(SimpleErrorMessage(message: "Unable to get users"))
        completion(result)
    }
}

class UsersProvider_DummyPass: UsersProvider {
    func getUsers(completion: @escaping UsersProviderCompletionHandler) {
        let result: UsersProviderResult = .success([])
        completion(result)
    }
}
