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
            case .success(let users):
                XCTAssert(false, "Test is designed to fail")
            case .failure(let error):
                XCTAssert(true, "Provider can fail")
            }
        }
    }

}
