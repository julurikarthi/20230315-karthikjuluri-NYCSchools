//
//  _0230315_karthikjuluri_NYCSchoolsTests.swift
//  20230315-karthikjuluri-NYCSchoolsTests
//
//  Created by Karthik Juluri - Vendor on 3/15/23.
//

import XCTest
@testable import _0230315_karthikjuluri_NYCSchools

final class _0230315_karthikjuluri_NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testgetSchoolDetails() throws {
        let expectation = self.expectation(description: "loading Mock data")
        var details: SchoolDetails?
        let model = SchoolDetailsViewModelMock()
        model.getSchoolDetails(dbn: "ew") { schooldetails in
            details = schooldetails
            if details != nil {
                expectation.fulfill()
            } else {
                XCTAssert(false)
            }
        }

        waitForExpectations(timeout: 2) { error in
            if details != nil {
                XCTAssert(true)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
