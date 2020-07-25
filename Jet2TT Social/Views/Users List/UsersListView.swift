//
//  UsersListView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct UsersListView: View {
    
    @ObservedObject var viewModel: UsersListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { (user) in
                ZStack {
                    UserCellView(viewModel: .init(user: user))
                    
                    NavigationLink(destination: UserProfileView(viewModel: .init(user: user))) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle("Users")
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(viewModel: .init(provider: UsersProvider_DummyPass()))
    }
}
