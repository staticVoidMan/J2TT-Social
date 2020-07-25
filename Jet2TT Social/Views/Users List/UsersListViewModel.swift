//
//  UsersListViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class UsersListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var error: String?
    
    private let provider: UsersProvider
    
    init(provider: UsersProvider) {
        self.provider = provider
        refresh()
    }
    
    func refresh() {
        self.provider.getUsers { (result) in
            switch result {
            case .success(let response):
                self.users = response
            case .failure(let error):
                self.error = error.message
            }
        }
    }
    
}
