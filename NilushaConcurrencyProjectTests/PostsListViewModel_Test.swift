//
//  PostsListViewModel_Test.swift
//  NilushaConcurrencyProjectTests
//
//  Created by Nilusha Niwanthaka Wimalasena on 8/2/24.
//

import XCTest
@testable import NilushaConcurrencyProject

final class PostsListViewModel_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PostsListViewModel_service() {
        let service = Mock_Service()
        
        let vm = PostsListViewModel(service: service)
        
        XCTAssertNotNil(vm.service)
    }
    
    func test_PostsListViewModel_FetchPosts_Success() {
        let service = Mock_Service()
        
        let vm = PostsListViewModel(service: service)
        Task{
            await vm.fetchPosts()
            XCTAssertNotNil(vm.posts)
            XCTAssertEqual(vm.posts.count, 10)
        }
    }
    
    func test_PostsListViewModel_FetchPosts_Failure() {
        let service = Mock_Service_Error()
        
        let vm = PostsListViewModel(service: service)
        Task{
            await vm.fetchPosts()
            XCTAssertEqual(vm.showAlert, true)
            XCTAssertNotNil(vm.errorMessage)
        }
    }
}
