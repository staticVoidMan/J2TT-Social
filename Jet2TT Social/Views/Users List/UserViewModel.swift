//
//  UserViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    
    private let user: User
    
    init(user: User) {
        self.user = user
        loadImage()
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
    
    var about: String {
        return user.about
    }
    
    @Published var imageData: Data?
    
    func loadImage() {
        URLSession.shared.dataTask(with: user.avatar) { (data, response, error) in
            DispatchQueue.main.async {
                 self.imageData = data
            }
        }
        .resume()
    }
    
}
