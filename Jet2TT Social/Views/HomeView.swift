//
//  HomeView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TabView {
                BlogsListView()
                    .tabItem { Image(systemName: "circle") }
                UsersListView(viewModel: UsersListViewModel(provider: UsersProvider_DummyPass()))
                    .tabItem { Image(systemName: "triangle") }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
