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
    let name: String
    let avatar: URL?
    let designation: String
    let city: String
    let about: String
}

extension User: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar
        case designation
        case city
        case about
    }
}

extension User: Identifiable {}

extension User {
    static var dummyUser1: User {
        let data = """
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
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(User.self, from: data)
    }
    
    static var dummyUser2: User {
        let data = """
        {
          "id": "2",
          "createdAt": "2020-04-17T15:45:52.759Z",
          "name": "Jada Nader",
          "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/kohette/128.jpg",
          "lastname": "Satterfield",
          "city": "Port Giovanni",
          "designation": "Internal Quality Facilitator",
          "about": "If we generate the alarm, we can get to the TCP bus through the 1080p JSON application!"
        }
        """.data(using: .utf8)!
        return try! JSONDecoder().decode(User.self, from: data)
    }
}
