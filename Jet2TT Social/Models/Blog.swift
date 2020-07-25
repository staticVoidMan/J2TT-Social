//
//  Blog.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

/*
 {
   "id": "1",
   "createdAt": "2020-04-17T12:13:44.575Z",
   "content": "calculating the program won't do anything, we need to navigate the multi-byte SMS alarm!",
   "comments": 8237,
   "likes": 62648,
   "media": [
     {
       "id": "1",
       "blogId": "1",
       "createdAt": "2020-04-16T22:43:18.606Z",
       "image": "https://s3.amazonaws.com/uifaces/faces/twitter/joe_black/128.jpg",
       "title": "maximized system",
       "url": "http://providenci.com"
     }
   ],
   "user": [
     {
       "id": "1",
       "blogId": "1",
       "createdAt": "2020-04-16T20:17:42.437Z",
       "name": "Dayton",
       "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/erwanhesry/128.jpg",
       "lastname": "Haag",
       "city": "West Ima",
       "designation": "Human Group Assistant",
       "about": "Try to calculate the SDD bandwidth, maybe it will override the auxiliary card!"
     }
   ]
 }
 */

struct Blog: Identifiable {
    struct Media {
        let id: String
        let title: String
        let image: URL
        let article: URL
    }
    
    let id: String
    let content: String
    
    let comments: Int
    let likes: Int
    
    let media: [Media]
    let user: [User]
    
    let createdAt: Date
}


import Foundation
extension Blog: Decodable {}

extension Blog.Media: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case article = "url"
    }
}

extension Blog {
    static var dummyBlogWithMedia: Blog {
        let data = """
        {
          "id": "1",
          "createdAt": "2017-11-16T02:02:55.000-08:00",
          "createdAt": "2020-04-17T12:13:44.575Z",
          "content": "calculating the program won't do anything, we need to navigate the multi-byte SMS alarm!",
          "comments": 8237,
          "likes": 62648,
          "media": [
            {
              "id": "1",
              "blogId": "1",
              "createdAt": "2020-04-16T22:43:18.606Z",
              "image": "https://s3.amazonaws.com/uifaces/faces/twitter/joe_black/128.jpg",
              "title": "maximized system",
              "url": "http://providenci.com"
            }
          ],
          "user": [
            {
              "id": "1",
              "blogId": "1",
              "createdAt": "2020-04-16T20:17:42.437Z",
              "name": "Dayton",
              "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/erwanhesry/128.jpg",
              "lastname": "Haag",
              "city": "West Ima",
              "designation": "Human Group Assistant",
              "about": "Try to calculate the SDD bandwidth, maybe it will override the auxiliary card!"
            }
          ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Full)
        return try! decoder.decode(Blog.self, from: data)
    }
    
    static var dummyBlogWithoutMedia: Blog {
        let data = """
        {
          "id": "50",
          "createdAt": "2020-04-16T20:22:27.214Z",
          "content": "If we transmit the hard drive, we can get to the SCSI capacitor through the redundant SSL application!",
          "comments": 40360,
          "likes": 747,
          "media": [],
          "user": [
            {
              "id": "50",
              "blogId": "50",
              "createdAt": "2020-04-17T01:00:29.253Z",
              "name": "Delia",
              "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/laasli/128.jpg",
              "lastname": "Hayes",
              "city": "North Dovieton",
              "designation": "Investor Security Planner",
              "about": "If we input the array, we can get to the XSS transmitter through the wireless XML microchip!"
            }
          ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Full)
        return try! decoder.decode(Blog.self, from: data)
    }
}
