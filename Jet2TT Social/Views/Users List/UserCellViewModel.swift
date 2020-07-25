//
//  UserCellViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

struct UserCellViewModel {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var name: String {
        return user.name
    }
    
    var designation: String {
        return user.designation
    }
    
    var city: String {
        return user.city
    }
    
}
