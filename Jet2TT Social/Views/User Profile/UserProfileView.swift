//
//  UserProfileView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    
    let viewModel: UserProfileViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 240)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(120)
            
            Text(viewModel.name)
                .font(.title)
                .padding()
            
            Text(viewModel.designation)
            
            Text(viewModel.city)
                .padding()
            
            Text(viewModel.about)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("User Profile")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserProfileView(viewModel: .init(user: .dummyUser1))
        }
    }
}
