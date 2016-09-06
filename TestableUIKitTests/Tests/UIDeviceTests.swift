//
//  UIDeviceTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/21/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIDeviceTests: XCTestCase {

    var device: UIDevice!

    override func setUp() {
        super.setUp()

        let realDevice = UIDevice.currentDevice()
        device = realDevice as UIDevice
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testForcingIdiomToPhone() {
        let trueIdiom = device.userInterfaceIdiom
        device.forceUserInterfaceIdiom(UIUserInterfaceIdiom.Phone)
        XCTAssertEqual(device.userInterfaceIdiom, UIUserInterfaceIdiom.Phone, "The idiom should be forced to 'Phone'")
        device.forceUserInterfaceIdiom(nil)
        XCTAssertEqual(device.userInterfaceIdiom, trueIdiom, "The true idiom should be restored")
    }

    func testForcingIdiomToPad() {
        XCTAssertEqual(device.userInterfaceIdiom, UIUserInterfaceIdiom.Phone, "The idiom should be forced to 'Pad'")
    }

    func testForcingOrientationToUnknown() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.Unknown, "The orientation should be forced to 'Unknown'")
    }

    func testForcingOrientationToPortrait() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.Portrait, "The orientation should be forced to 'Portrait'")
    }

    func testForcingOrientationToPortraitUpsideDown() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.PortraitUpsideDown, "The orientation should be forced to 'PortraitUpsideDown'")
    }

    func testForcingOrientationToLandscapeLeft() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.LandscapeLeft, "The orientation should be forced to 'LandscapeLeft'")
    }

    func testForcingOrientationToLandscapeRight() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.LandscapeRight, "The orientation should be forced to 'LandscapeRight'")
    }

    func testForcingOrientationToFaceUp() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.FaceUp, "The orientation should be forced to 'FaceUp'")
    }

    func testForcingOrientationToFaceDown() {
        XCTAssertEqual(device.orientation, UIDeviceOrientation.FaceDown, "The orientation should be forced to 'FaceDown'")
    }

}
