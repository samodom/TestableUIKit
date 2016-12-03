//
//  DataFileAssociationsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import FoundationSwagger
@testable import TestableUIKit

class DataFileAssociationsTests: XCTestCase {

    let filename = "sample" as ObjectAssociationFilename

    class TestSpy: Spy {}
    let spy = TestSpy()

    let data = "sample string".data(using: .utf8)!
    let expectedUrl = DocumentsDirectoryURL
        .appendingPathComponent("associations")
        .appendingPathComponent("sample")

    func testDataFileAssociation() {
        spy.associateData(data, with: filename)

        var storedData = spy.associatedData(for: filename)
        XCTAssertEqual(storedData, data, "The stored data should be retrieved using the complex key")

        spy.removeStoredAssociation(for: filename)
        storedData = spy.associatedData(for: filename)
        XCTAssertNil(storedData, "The stored data should have been cleared")
    }

}
