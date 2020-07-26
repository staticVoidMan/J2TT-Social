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
    let avatar: URL
    let designation: String
    let city: String
    let about: String
}

extension User: Decodable {}
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

import CoreData
extension User {
    init(from core: CDUser) {
        self.id = core.id!
        self.name = core.name!
        self.avatar = URL(string: core.avatar!)!
        self.designation = core.designation!
        self.city = core.city!
        self.about = core.about!
    }
    
    func save(to context: NSManagedObjectContext) {
        let core: CDUser = {
            let request: NSFetchRequest<CDUser> = {
                let request = NSFetchRequest<CDUser>(entityName: "CDUser")
                
                let key = #keyPath(CDUser.id)
                request.predicate = NSPredicate(format: "%K == %@", key, self.id)
                
                return request
            }()
            
            do {
                let resultsMatched = try context.fetch(request)
                if let resultFound = resultsMatched.first {
                    return resultFound
                } else {
                    return CDUser(context: context)
                }
            } catch {
                print(error)
                return CDUser(context: context)
            }
        }()
        
        core.id = self.id
        core.name = self.name
        core.designation = self.designation
        core.city = self.city
        core.about = self.about
        core.avatar = self.avatar.absoluteString
    }
}
