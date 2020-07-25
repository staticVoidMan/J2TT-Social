//
//  BlogCellView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct BlogCellView: View {
    
    @ObservedObject var viewModel: BlogCellViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                BlogOwnerCellView(viewModel: .init(user: viewModel.user,
                                                   dated: viewModel.postedDate))
                
                NavigationLink(destination: UserProfileView(viewModel: .init(user: viewModel.user!))) {
                    EmptyView()
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if viewModel.hasMedia {
                Image(uiImage: {
                    if let data = self.viewModel.imageData, let image = UIImage(data: data) {
                        return image
                    } else {
                        return UIImage(systemName: "rectangle.fill")!
                    }
                }())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .clipped()
            }
            
            Text(viewModel.postContent)
                .layoutPriority(1)
            
            if viewModel.hasMedia {
                VStack(alignment: .leading) {
                    Text(viewModel.articleTitle)
                    Text(viewModel.articleURL)
                        .font(.callout)
                }
                .padding([.top, .bottom], 8)
            }
            
            HStack {
                Text(viewModel.numberOfLikes)
                Spacer()
                Text(viewModel.numberOfComments)
            }
            .padding(.top, 8)
        }
    }
}

struct BlogCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlogCellView(viewModel: .init(blog: Blog.dummyBlogWithMedia))
                .previewDisplayName("With Media")
                .previewLayout(.sizeThatFits)
                .padding()
            
            BlogCellView(viewModel: .init(blog: Blog.dummyBlogWithoutMedia))
                .previewDisplayName("Without Media")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
