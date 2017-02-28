//
//  UIPageViewControllerSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/28/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit


class UIPageViewControllerSpiesTests: XCTestCase {

    let controller = UIPageViewController(
        transitionStyle: .pageCurl,
        navigationOrientation: .horizontal
    )

    let page1 = UIViewController()
    let page2 = UIViewController()

    let rootViewController = UIApplication.rootViewController

    override func setUp() {
        super.setUp()

        controller.setViewControllers(
            [page1],
            direction: .reverse,
            animated: false,
            completion: { _ in }
        )

        UIApplication.rootViewController = controller
    }

    override func tearDown() {
        UIApplication.rootViewController = rootViewController

        super.tearDown()
    }


    // MARK: - `setViewControllers(_:direction:animated:completion:)`

    func testSpyingOnSetViewControllersWithoutForwarding() {
        XCTAssertFalse(controller.setViewControllersCalled,
                       "By default the controller should not indicate having been asked to set its view controllers")
        XCTAssertNil(controller.setViewControllersControllers,
                     "By default there should be no captured view controllers")
        XCTAssertNil(controller.setViewControllersDirection,
                     "By default there should be no captured direction")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.setViewControllersCompletion,
                     "By default there should be no captured completion handler")

        UIPageViewController.SetViewControllersSpyController.forwardingBehavior = .custom(false)
        let spy = UIPageViewController.SetViewControllersSpyController.createSpy(on: controller)!
        spy.beginSpying()

        var completionHandlerInvoked = false
        let completion: UIViewAnimationsCompletion = { _ in
            completionHandlerInvoked = true
        }

        controller.setViewControllers(
            [page2],
            direction: .forward,
            animated: true,
            completion: completion
        )

        XCTAssertTrue(controller.setViewControllersCalled,
                      "The controller should indicate having been asked to setViewControllers a view controller")
        XCTAssertEqual(controller.setViewControllersControllers!, [page2],
                       "The view controller should be captured")
        XCTAssertEqual(controller.setViewControllersDirection!, .forward,
                       "The direction should be captured")
        XCTAssertTrue(controller.setViewControllersAnimated!, "The animation flag should be captured")
        XCTAssertEqual(controller.viewControllers!, [page1],
                       "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        let capturedCompletion = controller.setViewControllersCompletion
        capturedCompletion!(true)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured when not forwarding spy method calls")

        spy.endSpying()

        XCTAssertFalse(controller.setViewControllersCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersControllers,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "The animation flag should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnSetViewControllersWithForwarding() {
        XCTAssertFalse(controller.setViewControllersCalled,
                       "By default the controller should not indicate having been asked to set its view controllers")
        XCTAssertNil(controller.setViewControllersControllers,
                     "By default there should be no captured view controllers")
        XCTAssertNil(controller.setViewControllersDirection,
                     "By default there should be no captured direction")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.setViewControllersCompletion,
                     "By default there should be no captured completion handler")

        UIPageViewController.SetViewControllersSpyController.forwardingBehavior = .custom(true)
        let spy = UIPageViewController.SetViewControllersSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let completion: UIViewAnimationsCompletion = { _ in }

        controller.setViewControllers(
            [page2],
            direction: .forward,
            animated: true,
            completion: completion
        )

        XCTAssertTrue(controller.setViewControllersCalled,
                      "The controller should indicate having been asked to setViewControllers a view controller")
        XCTAssertEqual(controller.setViewControllersControllers!, [page2],
                       "The view controller should be captured")
        XCTAssertEqual(controller.setViewControllersDirection!, .forward,
                       "The direction should be captured")
        XCTAssertTrue(controller.setViewControllersAnimated!, "The animation flag should be captured")
        XCTAssertEqual(controller.viewControllers!, [page2],
                      "The spy method should forward the method call to the original implementation")
        XCTAssertNil(controller.setViewControllersCompletion,
                       "The completion handler should not be captured when forwarding spy methods")

        spy.endSpying()

        XCTAssertFalse(controller.setViewControllersCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersControllers,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersAnimated,
                     "The animation flag should be cleared after spying is complete")
        XCTAssertNil(controller.setViewControllersCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

}
