//
//  Blog+CoreData.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import CoreData

extension Blog {
    init(from core: CDBlog) {
        self.id = core.id!
        self.content = core.content!
        
        self.comments = Int(core.comments)
        self.likes = Int(core.likes)
        
        self.media = {
            guard let core = core.media else { return [] }
            let media = Media(from: core)
            return [media]
        }()
        
        self.user = {
            guard let core = core.user else { return [] }
            let user = User(from: core)
            return [user]
        }()
        
        self.createdAt = core.createdAt!
    }
    
    @discardableResult
    func save(to context: NSManagedObjectContext) -> CDBlog {
        let core: CDBlog = {
            let request: NSFetchRequest<CDBlog> = {
                let request = NSFetchRequest<CDBlog>(entityName: "CDBlog")
                
                let key = #keyPath(CDBlog.id)
                request.predicate = NSPredicate(format: "%K == %@", key, self.id)
                
                return request
            }()
            
            do {
                let resultsMatched = try context.fetch(request)
                if let resultFound = resultsMatched.first {
                    return resultFound
                } else {
                    return CDBlog(context: context)
                }
            } catch {
                print(error)
                return CDBlog(context: context)
            }
        }()
        
        core.id = self.id
        core.content = self.content
        
        core.comments = Int32(self.comments)
        core.likes = Int32(self.likes)
        
        core.media = self.media.first?.save(to: context)
        core.user = self.user.first!.save(to: context)
        
        core.createdAt = self.createdAt
        
        return core
    }
}

extension Blog.Media {
    init(from core: CDMedia) {
        self.id = core.id!
        self.title = core.title!
        self.image = URL(string: core.image!)!
        self.article = URL(string: core.article!)!
    }
    
    func save(to context: NSManagedObjectContext) -> CDMedia {
        let core: CDMedia = {
            let request: NSFetchRequest<CDMedia> = {
                let request = NSFetchRequest<CDMedia>(entityName: "CDMedia")
                
                let key = #keyPath(CDMedia.id)
                request.predicate = NSPredicate(format: "%K == %@", key, self.id)
                
                return request
            }()
            
            do {
                let resultsMatched = try context.fetch(request)
                if let resultFound = resultsMatched.first {
                    return resultFound
                } else {
                    return CDMedia(context: context)
                }
            } catch {
                print(error)
                return CDMedia(context: context)
            }
        }()
        
        core.id = self.id
        core.title = self.title
        core.image = self.image.absoluteString
        core.article = self.article.absoluteString
        
        return core
    }
}

