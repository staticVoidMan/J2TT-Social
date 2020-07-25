//
//  BlogOwnerCellViewModel.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

class BlogOwnerCellViewModel: ObservableObject {
    
    private let user: User?
    private let date: Date
    
    init(user: User?, dated date: Date) {
        self.user = user
        self.date = date
        loadImage()
    }
    
    var username: String {
        return user?.name ?? "Unknown"
    }
    
    var userDesignation: String {
        return user?.designation ?? "---"
    }
    
    var relativeTimeStamp: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        let string = formatter.localizedString(for: date, relativeTo: Date())
        return string
    }
    
    @Published var imageData: Data?
    
    func loadImage() {
        guard let url = user?.avatar else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                 self.imageData = data
            }
        }
        .resume()
    }
    
}
