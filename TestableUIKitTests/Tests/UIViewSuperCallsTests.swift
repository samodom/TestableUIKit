//
//  UIViewSuperCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIViewSuperCallsTests: XCTestCase {

    let goodView = GoodView()
    let plainView = UIView()
    let emptyView = EmptyView()
    let subView = GoodViewSubclass()
    let badView = BadView()
    var callingViews = [UIView]()

    override func setUp() {
        super.setUp()

        callingViews += [goodView, plainView, emptyView, subView]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testGoodUpdateConstraintsSuperCall() {
        for view in callingViews {
            view.updateConstraints()
            XCTAssertTrue(view.calledUpdateConstraints, "The superclass's updateConstraints method should be called by the view")
        }
    }

    func testBadUpdateConstraintsSuperCall() {
        badView.updateConstraints()
        XCTAssertFalse(badView.calledUpdateConstraints, "The superclass's updateConstraints method is not called by the bad view")
    }

    func testGoodDrawRectSuperCall() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        for view in callingViews {
            view.drawRect(rect)
            XCTAssertTrue(view.calledDrawRect, "The superclass's drawRect method should be called by the view")
            XCTAssertEqual(view.drawRectRect!, rect, "The rect should be passed to the superclass")
        }
    }

    func testBadDrawRectSuperCall() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        badView.drawRect(rect)
        XCTAssertFalse(emptyView.calledDrawRect, "The superclass's drawRect method is not called by the bad view")
        XCTAssertTrue(emptyView.drawRectRect == nil, "The rect should still be missing")
    }

    func testGoodEncodeRestorableStateWithCoderSuperCall() {
        for view in callingViews {
            let coder = NSKeyedArchiver(forWritingWithMutableData: NSMutableData())
            view.encodeRestorableStateWithCoder(coder)
            coder.finishEncoding()
            XCTAssertTrue(view.calledEncodeRestorableStateWithCoder, "The superclass's encodeRestorableStateWithCoder method should be called by the view")
            XCTAssertEqual(view.encodeRestorableStateCoder!, coder, "The coder should be passed to the superclass")
        }
    }

    func testBadEncodeRestorableStateWithCoderSuperCall() {
        let coder = NSKeyedArchiver(forWritingWithMutableData: NSMutableData())
        badView.encodeRestorableStateWithCoder(coder)
        coder.finishEncoding()
        XCTAssertFalse(badView.calledEncodeRestorableStateWithCoder, "The superclass's encodeRestorableStateWithCoder method is not called by the bad view")
        XCTAssertNil(badView.encodeRestorableStateCoder, "The coder should still be missing")
    }

    func testGoodDecodeRestorableStateWithCoderSuperCall() {
        for view in callingViews {
            let data = NSMutableData()
            let encoder = NSKeyedArchiver(forWritingWithMutableData: data)
            view.encodeRestorableStateWithCoder(encoder)
            encoder.finishEncoding()

            let decoder = NSKeyedUnarchiver(forReadingWithData: data)
            view.decodeRestorableStateWithCoder(decoder)
            XCTAssertTrue(view.calledDecodeRestorableStateWithCoder, "The superclass's decodeRestorableStateWithCoder method should be called by the view")
            XCTAssertEqual(view.decodeRestorableStateCoder!, decoder, "The coder should be passed to the superclass")
        }
    }

    func testBadDecodeRestorableStateWithCoderSuperCall() {
        let data = NSMutableData()
        let encoder = NSKeyedArchiver(forWritingWithMutableData: data)
        badView.encodeRestorableStateWithCoder(encoder)
        encoder.finishEncoding()

        let decoder = NSKeyedUnarchiver(forReadingWithData: data)
        badView.decodeRestorableStateWithCoder(decoder)
        XCTAssertFalse(badView.calledDecodeRestorableStateWithCoder, "The superclass's decodeRestorableStateWithCoder method is not called by the bad view")
        XCTAssertNil(badView.decodeRestorableStateCoder, "The coder should still be missing")
    }

}
