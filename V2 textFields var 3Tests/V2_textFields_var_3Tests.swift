//
//  V2_textFields_var_3Tests.swift
//  V2 textFields var 3Tests
//
//  Created by Alex on 05.03.2023.
//

import XCTest
@testable import V2_textFields_var_3

final class V2_textFields_var_3Tests: XCTestCase {

    var noDigits: NoDigitsManager!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        noDigits = NoDigitsManager()
        
        
    }

    override func tearDownWithError() throws {
        noDigits = nil
        try super.tearDownWithError()
        
    }

    func testExample() throws {
        let simple = "2324"
        let result = noDigits.isNoDigit(in: simple) //isNoDigit(in: "32423")
        XCTAssertTrue(result)
     
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
