//
//  TestCases.swift
//  Jet2TT SocialTests
//
//  Created by Amin Siddiqui on 25/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import XCTest
@testable import Jet2TT_Social

class TestCases: XCTestCase {
    
    func testUsersProviderCanFail() {
        let provider = UsersProvider_DummyFailure()
        provider.getUsers { (result) in
            switch result {
            case .success:
                XCTAssert(false, "Test is designed to fail")
            case .failure:
                XCTAssert(true, "Provider can fail")
            }
        }
    }
    
    func testUsersProviderCanPass() {
        let provider = UsersProvider_DummyPass()
        provider.getUsers { (result) in
            switch result {
            case .success:
                XCTAssert(true, "Provider can succeed")
            case .failure:
                XCTAssert(false, "Test is designed to pass")
            }
        }
    }
    
    func testCanGetUsersFromAPI() {
        let signal = expectation(description: "API success")
        
        let provider = UsersProvider_API()
        provider.getUsers { (result) in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTAssert(false, "Test is designed to pass")
            }
            
            signal.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (error) in
            print(error)
        }
    }
    
    func testCanGetBlogsFromAPI() {
        let signal = expectation(description: "API success")
        
        let provider = BlogsProvider_API()
        provider.getBlogs(pagination: Pagination()) { (result) in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTAssert(false, "Test is designed to pass")
            }
            
            signal.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (error) in
            print(error)
        }
    }

}
