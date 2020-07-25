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
            List(viewModel.blogs) { (blog) in
                BlogCellView(viewModel: .init(blog: blog))
                    .padding([.top, .bottom], 8)
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
