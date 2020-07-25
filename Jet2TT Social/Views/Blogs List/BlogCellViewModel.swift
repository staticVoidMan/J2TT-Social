//
//  BlogCellViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class BlogCellViewModel: ObservableObject {
    
    private let blog: Blog
    
    init(blog: Blog) {
        self.blog = blog
        loadImage()
    }
    
    var user: User? {
        return blog.user.first
    }
    
    var postedDate: Date {
        return blog.createdAt
    }
    
    var hasMedia: Bool {
        return media != nil
    }
    
    private var media: Blog.Media? {
        return blog.media.first
    }
    
    var articleTitle: String {
        return media?.title ?? "---"
    }
    
    var articleURL: String {
        return media?.article.absoluteString ?? "---"
    }
    
    var postContent: String {
        return blog.content
    }
    
    var numberOfLikes: String {
        return "\(blog.likes) Likes"
    }
    
    var numberOfComments: String {
        return "\(blog.comments) Comments"
    }
    
    @Published var imageData: Data?
    
    func loadImage() {
        guard let url = blog.media.first?.image else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                 self.imageData = data
            }
        }
        .resume()
    }
    
}
