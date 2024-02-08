//
//  LoginViewModel_Test.swift
//  NilushaConcurrencyProjectTests
//
//  Created by Nilusha Niwanthaka Wimalasena on 8/2/24.
//

import XCTest
@testable import NilushaConcurrencyProject

final class LoginViewModel_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor
    func test_LoginViewModel_validateEmailPassword_validValues() {
        let vm = LoginViewModel()
        vm.email = "abc@gmail.com"
        vm.password = "abc123"
        vm.validateEmailPassword()
        XCTAssertEqual(vm.correctEmail, true)
        XCTAssertEqual(vm.correctEmail, true)
    }

    @MainActor
    func test_LoginViewModel_validateEmailPassword_invalidValues() {
        let vm = LoginViewModel()
        vm.email = "abc.com"
        vm.password = "abc"
        vm.validateEmailPassword()
        XCTAssertEqual(vm.correctEmail, false)
        XCTAssertEqual(vm.correctEmail, false)
    }
}
