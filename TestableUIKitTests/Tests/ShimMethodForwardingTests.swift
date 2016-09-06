//
//  ShimMethodForwardingTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/21/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class ShimMethodForwardingTests: XCTestCase {

    var childObject = SampleForwardingChild()

    func testMethodsNotForwardedByDefault() {
        SampleForwardingChild.shouldForwardMethodsByDefault = false
        childObject.sampleMethod()
        XCTAssertFalse(childObject.superSampleMethodCalled, "Methods should not be forwarded by default per the flag")
    }

    func testMethodsForwardedByDefault() {
        SampleForwardingChild.shouldForwardMethodsByDefault = true
        childObject.sampleMethod()
        XCTAssertTrue(childObject.superSampleMethodCalled, "Methods should be forwarded by default per the flag")
    }

    func testMethodsNotForwardedWhenListedContraryToFlag() {
        SampleForwardingChild.shouldForwardMethodsByDefault = true
        SampleForwardingChild.setShouldForwardMethodForSelector(
            SampleForwardingChild.SampleForwardingParentTestableSelectors.SampleMethod,
            false
        )
        childObject.sampleMethod()
        XCTAssertFalse(childObject.superSampleMethodCalled, "The method should not be forwarded per its forwarding flag")
    }

    func testMethodsForwardedWhenListedContraryToFlag() {
        SampleForwardingChild.shouldForwardMethodsByDefault = false
        SampleForwardingChild.setShouldForwardMethodForSelector(
            SampleForwardingChild.SampleForwardingParentTestableSelectors.SampleMethod,
            true
        )
        childObject.sampleMethod()
        XCTAssertTrue(childObject.superSampleMethodCalled, "The method should be forwarded per its forwarding flag")
    }

}

private class SampleForwardingParent {

    private var superSampleMethodCalled = false

    private func sampleMethod() {
        superSampleMethodCalled = true
    }

}

let SampleMethodForwardingSelector = #selector(SampleForwardingParent.sampleMethod())

private class SampleForwardingChild: SampleForwardingParent, ShimMethodForwarding {

    private var shouldForwardMethodsByDefault = true

    private func sampleMethod() {
        if shouldForwardMethodCallWithSelector(selector) {
            super.sampleMethod()
        }
    }

    private enum SampleForwardingParentTestableSelectors {
        private static let SampleMethod = #selector(
            SampleForwardingParent.sampleMethod
        )
    }

}
