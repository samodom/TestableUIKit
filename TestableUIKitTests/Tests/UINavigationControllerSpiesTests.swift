//
//  UINavigationControllerSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/28/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UINavigationControllerSpiesTests: XCTestCase {

    let controller = UINavigationController()
    let controllerLevel0 = UIViewController()
    let controllerLevel1 = UIViewController()
    let controllerLevel2 = UIViewController()
    let rootViewController = UIApplication.rootViewController

    override func setUp() {
        super.setUp()

        UIApplication.rootViewController = controller
    }

    override func tearDown() {
        UIApplication.rootViewController = rootViewController

        super.tearDown()
    }


    // MARK: - `pushViewController(_:animated:)`

    func testSpyingOnPushViewController() {
        XCTAssertFalse(controller.pushViewControllerCalled,
                       "By default the navitation controller should not indicate having been asked to push a view controller")
        XCTAssertNil(controller.pushedController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.pushViewControllerAnimated,
                     "By default there should be no captured animation flag")

        let spy = UINavigationController.PushViewControllerSpyController.createSpy(on: controller)!
        spy.beginSpying()

        controller.pushViewController(controllerLevel0, animated: true)

        XCTAssertTrue(controller.pushViewControllerCalled,
                      "The navigation controller should indicate having been asked to push a view controller")
        XCTAssertEqual(controller.pushedController, controllerLevel0,
                       "The view controller should be captured")
        XCTAssertTrue(controller.pushViewControllerAnimated!,
                      "The animation flag should be captured")
        XCTAssertEqual(controller.topViewController, controllerLevel0,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.pushViewControllerCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.pushedController,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.pushViewControllerAnimated,
                     "The animation flag should be cleared after spying is complete")
    }


    // MARK: - `popViewController(animated:)`, `popToViewController(_:animated:)` and `popToRootViewController(animated:)`

    func testSpyingOnPopViewController() {
        XCTAssertFalse(controller.popCalled,
                       "By default the navitation controller should not indicate having been asked to pop a view controller")
        XCTAssertNil(controller.popAnimated,
                     "By default there should be no captured animation flag")

        controller.pushViewController(controllerLevel0, animated: false)
        controller.pushViewController(controllerLevel1, animated: false)

        let spy = UINavigationController.PopSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let poppedController = controller.popViewController(animated: false)

        XCTAssertTrue(controller.popCalled,
                      "The navigation controller should indicate having been asked to pop a view controller")
        XCTAssertFalse(controller.popAnimated!, "The animation flag should be captured")
        XCTAssertEqual(poppedController, controllerLevel1,
                       "The spy method should forward the method call to the original implementation")
        XCTAssertEqual(controller.topViewController, controllerLevel0,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.popCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.popAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testSpyingOnPopToViewController() {
        XCTAssertFalse(controller.popCalled,
                       "By default the navitation controller should not indicate having been asked to pop a view controller")
        XCTAssertNil(controller.poppedController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.popAnimated,
                     "By default there should be no captured animation flag")

        controller.pushViewController(controllerLevel0, animated: false)
        controller.pushViewController(controllerLevel1, animated: false)
        controller.pushViewController(controllerLevel2, animated: false)

        let spy = UINavigationController.PopSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let poppedControllers = controller.popToViewController(controllerLevel0, animated: false)

        XCTAssertTrue(controller.popCalled,
                      "The navigation controller should indicate having been asked to pop to a view controller")
        XCTAssertEqual(controller.poppedController, controllerLevel0,
                       "The target view controller should be captured")
        XCTAssertFalse(controller.popAnimated!, "The animation flag should be captured")
        XCTAssertEqual(poppedControllers!, [controllerLevel1, controllerLevel2],
                       "The spy method should forward the method call to the original implementation")
        XCTAssertEqual(controller.topViewController, controllerLevel0,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.popCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.poppedController,
                     "The target view controller should be cleared after spying is complete")
        XCTAssertNil(controller.popAnimated,
                     "The animation flag should be cleared after spying is complete")
    }

    func testSpyingOnPopToRootViewController() {
        XCTAssertFalse(controller.popCalled,
                       "By default the navitation controller should not indicate having been asked to pop a view controller")
        XCTAssertNil(controller.popAnimated,
                     "By default there should be no captured animation flag")

        controller.pushViewController(controllerLevel0, animated: false)
        controller.pushViewController(controllerLevel1, animated: false)
        controller.pushViewController(controllerLevel2, animated: false)

        let spy = UINavigationController.PopSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let poppedControllers = controller.popToRootViewController(animated: false)

        XCTAssertTrue(controller.popCalled,
                      "The navigation controller should indicate having been asked to pop to a view controller")
        XCTAssertFalse(controller.popAnimated!, "The animation flag should be captured")
        XCTAssertEqual(poppedControllers!, [controllerLevel1, controllerLevel2],
                       "The spy method should forward the method call to the original implementation")
        XCTAssertEqual(controller.topViewController, controllerLevel0,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.popCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.popAnimated,
                     "The animation flag should be cleared after spying is complete")
    }
    
}
