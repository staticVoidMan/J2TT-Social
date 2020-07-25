//
//  BlogsListViewModelTests.swift
//  Jet2TT SocialTests
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import XCTest

class BlogsListViewModelTests: XCTestCase {
    
    var viewModel: BlogsListViewModel?
    
    override func setUp() {
        viewModel = BlogsListViewModel(provider: BlogsProvider_DummyPass())
    }
    
    func testCanAccessUsersListViewModel() {
        XCTAssertNotNil(viewModel)
    }
    
    func testUsersListViewModelHasBlogs() {
        XCTAssertEqual(self.viewModel?.blogs.count, 2)
    }

}
