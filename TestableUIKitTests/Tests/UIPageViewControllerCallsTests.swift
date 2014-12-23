//
//  UIPageViewControllerCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIPageViewControllerCallsTests: XCTestCase {

    var pageController = UIPageViewController()
    var completion: UIPageViewControllerCompletionClosure!
    var invokedCompletionClosure = false

    override func setUp() {
        super.setUp()

        completion = { animated in
            self.invokedCompletionClosure = true
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSetViewControllersCall() {
        XCTAssertFalse(pageController.setViewControllersCalled, "The controller should not indicate having had setViewControllers called by default")
        XCTAssertNil(pageController.setViewControllersViewControllers, "The view controllers should be missing by default")
        XCTAssertTrue(pageController.setViewControllersDirection == nil, "The navigation direction should be missing by default")
        XCTAssertNil(pageController.setViewControllersAnimated, "The animation flag should be missing by default")
        XCTAssertTrue(pageController.setViewControllersCompletion == nil, "The completion closure should be missing by default")
        let controllers = [UIViewController()]
        pageController.setViewControllers(controllers as [AnyObject], direction: .Reverse, animated: true, completion: completion)
        XCTAssertTrue(pageController.setViewControllersCalled, "The controller should now indicate having had setViewControllers called")
        XCTAssertEqual(pageController.setViewControllersViewControllers!, controllers, "The view controllers should be captured")
        XCTAssertEqual(pageController.setViewControllersDirection!, UIPageViewControllerNavigationDirection.Reverse, "The navigation direction should be captured")
        XCTAssertTrue(pageController.setViewControllersAnimated!, "The animation flag should be captured")
        XCTAssertTrue(pageController.setViewControllersCompletion != nil, "The completion closure should be captured")
        pageController.setViewControllersCompletion!(true)
        XCTAssertTrue(invokedCompletionClosure, "The completion closure should be captured")
    }

}
