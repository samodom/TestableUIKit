//
//  UITabBarControllerCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UITabBarControllerCallsTests: XCTestCase {

    let tabController = UITabBarController()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSetViewControllersCall() {
        XCTAssertFalse(tabController.setViewControllersCalled, "The controller should not indicate having had setViewControllers called by default")
        XCTAssertNil(tabController.setViewControllersViewControllers, "The view controllers should be missing by default")
        XCTAssertNil(tabController.setViewControllersAnimated, "The animation flag should be missing by default")
        let controllers = [UIViewController(), UIViewController(), UIViewController()]
        tabController.setViewControllers(controllers as [AnyObject], animated: true)
        XCTAssertTrue(tabController.setViewControllersCalled, "The controller should now indicate having had setViewControllers called")
        XCTAssertEqual(tabController.setViewControllersViewControllers!, controllers, "The view controllers should be captured")
        XCTAssertTrue(tabController.setViewControllersAnimated!, "The animation flag should be captured")
    }

}
