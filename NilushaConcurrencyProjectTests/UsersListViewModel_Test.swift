//
//  UsersListViewModel_Test.swift
//  NilushaConcurrencyProjectTests
//
//  Created by Nilusha Niwanthaka Wimalasena on 7/2/24.
//

import XCTest
@testable import NilushaConcurrencyProject

//Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehaviour

//Testing structure: Given, When, Then

final class UsersListViewModel_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_UsersListViewModel_service() {
        let service = Mock_Service()
        
        let vm = UsersListViewModel(service: service)
        
        XCTAssertNotNil(vm.service)
    }
    
    func test_UsersListViewModel_FetchUsers_Success() {
        let service = Mock_Service()
        
        let vm = UsersListViewModel(service: service)
        Task{
            await vm.fetchUsers()
            XCTAssertNotNil(vm.users)
            XCTAssertEqual(vm.users.count, 10)
        }
    }
    
    func test_UsersListViewModel_FetchUsers_Failure() {
        let service = Mock_Service_Error()
        
        let vm = UsersListViewModel(service: service)
        Task{
            await vm.fetchUsers()
            XCTAssertEqual(vm.showAlert, true)
            XCTAssertNotNil(vm.errorMessage)
        }
    }
}
