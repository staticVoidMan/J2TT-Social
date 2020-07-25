//
//  HomeView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    let usersListViewModel: UsersListViewModel
    let blogsListViewModel: BlogsListViewModel
    
    var body: some View {
        VStack {
            TabView {
                BlogsListView(viewModel: blogsListViewModel)
                    .tabItem { Image(systemName: "circle") }
                
                UsersListView(viewModel: usersListViewModel)
                    .tabItem { Image(systemName: "triangle") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var usersListViewModel: UsersListViewModel {
        let provider: UsersProvider = UsersProvider_DummyPass()
        return .init(provider: provider)
    }
    static var blogsListViewModel: BlogsListViewModel {
        let provider: BlogsProvider = BlogsProvider_DummyPass()
        return .init(provider: provider)
    }
    
    static var previews: some View {
        HomeView(usersListViewModel: usersListViewModel,
                 blogsListViewModel: blogsListViewModel)
    }
}
