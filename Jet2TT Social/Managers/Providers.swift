//
//  Providers.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 27/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation
import CoreData

enum Providers {
    static var context: NSManagedObjectContext {
        return CoreDataManager.shared.persistentContainer.viewContext
    }
    
    static var usersProvider: UsersProvider {
        return UsersProvider_API()
    }
    
    static var blogsProvider: BlogsProvider {
        return BlogsProvider_Local(context: context)
            .fallback(provider: BlogsProvider_API())
    }
}
