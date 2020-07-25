//
//  UserListCellView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct UserListCellView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: {
                if let data = self.viewModel.imageData, let image = UIImage(data: data) {
                    return image
                } else {
                    return UIImage(systemName: "person.crop.circle")!
                }
            }())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(22)
            
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                Text(viewModel.designation)
                    .font(.subheadline)
            }
            .layoutPriority(1)
            
            Spacer()
            
            VStack {
                Text(viewModel.city)
                    .font(.footnote)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false,
                               vertical: true)
                Spacer()
            }
        }
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserListCellView(viewModel: .init(user: User.dummyUser1))
            .previewLayout(.fixed(width: 360, height: 52))
            .padding()
    }
}
