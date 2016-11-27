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

    static let complexKey = ComplexObjectAssociationKey(
        simpleKey: ObjectAssociationKey("sample"),
        fileKey: "sample"
    )

    class TestSpy: Spy {}
    let spy = TestSpy()

    let data = "sample string".data(using: .utf8)!
    let url = DocumentsDirectoryURL
        .appendingPathComponent("associations")
        .appendingPathComponent("sample")

    func testDataFileAssociation() {
        spy.associateData(data, with: DataFileAssociationsTests.complexKey)

        var storedData = spy.associatedData(for: DataFileAssociationsTests.complexKey)
        XCTAssertEqual(storedData, data, "The stored data should be retrieved using the complex key")

        spy.removeStoredAssociation(for: DataFileAssociationsTests.complexKey)
        storedData = spy.associatedData(for: DataFileAssociationsTests.complexKey)
        XCTAssertNil(storedData, "The stored data should have been cleared")
    }

}
