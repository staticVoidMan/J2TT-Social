//
//  BlogsProvider_Local.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import CoreData

class BlogsProvider_Local: BlogsProvider {
    
    private let context: NSManagedObjectContext
    private var provider: BlogsProvider?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    @discardableResult
    func fallback(provider: BlogsProvider) -> Self {
        self.provider = provider
        return self
    }
    
    func getBlogs(pagination: Pagination, completion: @escaping BlogsProviderCompletionHandler) {
        if let models = tryLocalStore(pagination: pagination) {
            completion(.success(models))
        } else {
            tryFallbackProvider(pagination: pagination, completion: completion)
        }
    }
    
    func tryLocalStore(pagination: Pagination) -> [Blog]? {
        let request: NSFetchRequest<CDBlog> = {
            let request = NSFetchRequest<CDBlog>(entityName: "CDBlog")

            let sortKey = #keyPath(CDBlog.id)
            request.sortDescriptors = [NSSortDescriptor(key: sortKey, ascending: true)]
            
            request.fetchOffset = (pagination.offset - 1) * pagination.limit
            request.fetchLimit = pagination.limit
            
            return request
        }()
        
        do {
            let resultsMatched = try self.context
                .fetch(request)
                .map(Blog.init(from:))
            
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
    
    func tryFallbackProvider(pagination: Pagination, completion: @escaping BlogsProviderCompletionHandler) {
        if let provider = provider {
            provider.getBlogs(pagination: pagination) { (result) in
                do {
                    let models = try result.get()
                    models.forEach { (model) in
                        model.save(to: self.context)
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
