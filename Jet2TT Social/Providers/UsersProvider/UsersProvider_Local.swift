//
//  UsersProvider_Local.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import CoreData

class UsersProvider_Local: UsersProvider {
    
    private let context: NSManagedObjectContext
    private var provider: UsersProvider?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    @discardableResult
    func fallback(provider: UsersProvider) -> Self {
        self.provider = provider
        return self
    }
    
    func getUsers(completion: @escaping UsersProviderCompletionHandler) {
        if let users = tryLocalStore() {
            completion(.success(users))
        } else {
            tryFallbackProvider(completion: completion)
        }
    }
    
    func tryLocalStore() -> [User]? {
        let request: NSFetchRequest<CDUser> = NSFetchRequest<CDUser>(entityName: "CDUser")
        
        do {
            let resultsMatched = try self.context.fetch(request).map(User.init(from:))
            if resultsMatched.isEmpty == false {
                return resultsMatched
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }
    
    func tryFallbackProvider(completion: @escaping UsersProviderCompletionHandler) {
        if let provider = provider {
            provider.getUsers { (result) in
                do {
                    let users = try result.get()
                    users.forEach { (user) in
                        user.save(to: self.context)
                    }
                    
                    DispatchQueue.main.async {
                        do {
                            try self.context.save()
                        } catch {
                            print(error)
                        }
                    }
                } catch {
                    print(error)
                }
                
                completion(result)
            }
        } else {
            completion(.failure(SimpleErrorMessage(message: "TILT")))
        }
    }
    
}
