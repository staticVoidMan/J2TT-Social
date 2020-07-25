//
//  User.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

/*
  {
    "id": "1",
    "createdAt": "2020-04-17T10:08:42.915Z",
    "name": "Mrs. Jarod Pfeffer",
    "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/thimo_cz/128.jpg",
    "lastname": "Nader",
    "city": "East Ramirofurt",
    "designation": "Product Metrics Planner",
    "about": "generating the monitor won't do anything, we need to synthesize the solid state GB matrix!"
  }
 */

import Foundation

struct User {
    let id: String
    let firstName: String
    let lastName: String
    let avatar: URL
    let designation: String
    let city: String
    let about: String
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "name"
        case lastName = "lastname"
        case avatar
        case designation
        case city
        case about
    }
}
