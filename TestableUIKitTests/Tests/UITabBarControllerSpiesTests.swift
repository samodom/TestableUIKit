//
//  UITabBarControllerSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/28/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UITabBarControllerSpiesTests: XCTestCase {

    let controller = UITabBarController()
    let tabs = [UIViewController(), UIViewController()]


    // MARK: - `setViewControllers(_:animated:)`

    func testSetViewControllersControllerForwardingBehavior() {
        XCTAssertTrue(UITabBarController.SetViewControllersSpyController.forwardsInvocations,
                      "Spies on `setViewControllers(_:animated:)` should always forward their method invocations")
    }

    func testSpyingOnSetViewControllers() {
        XCTAssertFalse(controller.setViewControllersCalled,
                       "By default the controller should not indicate having been asked to set its view controllers")
        XCTAssertNil(controller.setViewControllersControllers,
                     "By default there should be no captured view controllers")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "By default there should be no captured animation flag")

        let spy = UITabBarController.SetViewControllersSpyController.createSpy(on: controller)!
        spy.beginSpying()

        controller.setViewControllers(tabs, animated: true)

        XCTAssertTrue(controller.setViewControllersCalled,
                      "The controller should indicate having been asked to setViewControllers a view controller")
        XCTAssertEqual(controller.setViewControllersControllers!, tabs,
                       "The view controller should be captured")
        XCTAssertTrue(controller.setViewControllersAnimated!,
                      "The animation flag should be captured")
        XCTAssertEqual(controller.viewControllers!, tabs,
                      "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.setViewControllersCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersControllers,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

}
