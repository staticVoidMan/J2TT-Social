//
//  BlogsListView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct BlogsListView: View {
    
    @ObservedObject var viewModel: BlogsListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<viewModel.blogs.count, id: \.self) { (index) in
                    BlogCellView(viewModel: .init(blog: self.viewModel.blogs[index]))
                        .padding([.top, .bottom], 8)
                        .onAppear { self.viewModel.loadedBlog(at: index) }
                }
                if viewModel.isLoadingMore {
                    Text("Loading...")
                }
            }
            .navigationBarTitle("Articles")
        }
    }
}

struct BlogsListView_Previews: PreviewProvider {
    static var previews: some View {
        BlogsListView(viewModel: .init(provider: BlogsProvider_DummyPass()))
    }
}
