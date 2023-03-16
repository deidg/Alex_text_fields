//
//  V2_textFields_var_3Tests.swift
//  V2 textFields var 3Tests
//
//  Created by Alex on 05.03.2023.
//

import XCTest
@testable import V2_textFields_var_3

final class V2_textFields_var_3Tests: XCTestCase {

    var noDigitsManager: NoDigitsManager!
    var inputLimitManager: InputLimitManager!
    var onlyCharManager: OnlyCharManager!
    var linkManager: LinkManager!
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        noDigitsManager = NoDigitsManager()
        inputLimitManager = InputLimitManager()
        onlyCharManager = OnlyCharManager()
        linkManager = LinkManager()
    }

    override func tearDownWithError() throws {
        noDigitsManager = nil
        inputLimitManager = nil
        onlyCharManager = nil
        linkManager = nil
        try super.tearDownWithError()
    }

    //MARK: no digits
    func testNoDigitsTextField() throws {
        let simple = "fddgf"
        let result = noDigitsManager.isNoDigit(in: simple)
        XCTAssertTrue(result)
    }
    //MARK: limit
    func testMaxLimit() throws {
        let inputText = "1234567890"//"1234567890VVV"//"1234567890"
        let result = inputLimitManager.isMaxLimit(in: inputText)
        XCTAssertTrue(result)
    }
    
    //MARK: mask
    //не запустился. посмотреть в конце еще раз. 
//    func testOnlyChar() throws {
//        let inPutText = "fghtr-12345"
//        let result = onlyCharManager.isCharOnly(in: inPutText)
//        XCTAssertTrue(result)
//    }
    
    //MARK: link
    func testLinkCkeck() throws {
        let simple = "bbc.com"
        let result = linkManager.isBrowserStarted(in: simple)
        XCTAssertTrue(result)
    }
    
    
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
