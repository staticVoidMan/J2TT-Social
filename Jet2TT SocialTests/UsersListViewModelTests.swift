//
//  UsersListViewModelTests.swift
//  Jet2TT SocialTests
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import XCTest

class UsersListViewModelTests: XCTestCase {
    
    var viewModel: UsersListViewModel?
    
    override func setUp() {
        viewModel = UsersListViewModel(provider: UsersProvider_DummyPass())
    }
    
    func testCanAccessUsersListViewModel() {
        XCTAssertNotNil(viewModel)
    }
    
    func testUsersListViewModelHasUsers() {
        XCTAssertEqual(self.viewModel?.users.count, 2)
    }

}
