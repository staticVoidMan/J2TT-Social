//
//  UserTests.swift
//  Jet2TT SocialTests
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import XCTest
@testable import Jet2TT_Social

class UserTests: XCTestCase {
    
    func testUsersProviderCanFail() {
        let provider = UsersProvider_DummyFailure()
        provider.getUsers { (result) in
            switch result {
            case .success(_):
                XCTAssert(false, "Test is designed to fail")
            case .failure(_):
                XCTAssert(true, "Provider can fail")
            }
        }
    }
    
    func testUsersProviderCanPass() {
        let provider = UsersProvider_DummyPass()
        provider.getUsers { (result) in
            switch result {
            case .success(_):
                XCTAssert(true, "Provider can succeed")
            case .failure(_):
                XCTAssert(false, "Test is designed to fail")
            }
        }
    }

}
