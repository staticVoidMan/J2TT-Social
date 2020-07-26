//
//  User+CoreData.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

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
    
    @discardableResult
    func save(to context: NSManagedObjectContext) -> CDUser {
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
        
        return core
    }
}
