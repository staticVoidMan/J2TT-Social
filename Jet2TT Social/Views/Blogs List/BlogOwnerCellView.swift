//
//  BlogOwnerCellView.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import SwiftUI

struct BlogOwnerCellView: View {
    
    @ObservedObject var viewModel: BlogOwnerCellViewModel
    
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
                Text(viewModel.username)
                    .font(.headline)
                Text(viewModel.userDesignation)
                    .font(.subheadline)
            }
            .layoutPriority(1)
            
            Spacer()
            
            VStack {
                Text(viewModel.relativeTimeStamp)
                    .font(.footnote)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false,
                               vertical: true)
                Spacer()
            }
        }
        .frame(maxHeight: 60)
    }
    
}

struct BlogOwnerCellView_Previews: PreviewProvider {
    static var previews: some View {
        BlogOwnerCellView(viewModel: .init(user: User.dummyUser1,
                                           dated: Date(timeIntervalSinceNow: -60)))
            .previewLayout(.sizeThatFits)
    }
}
