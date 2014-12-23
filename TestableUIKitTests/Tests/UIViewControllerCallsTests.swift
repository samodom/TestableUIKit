//
//  UIViewControllerCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class UIViewControllerCallsTests: XCTestCase {

    let customController = GoodViewController() as UIViewController
    let plainController = UIViewController()
    let subController = GoodViewControllerSubclass()
    let emptyController = EmptyViewController()
    var capturedControllers: [UIViewController]!

    var invokedCompletionClosure = false
    var completion: UIViewControllerPresentationCompletionClosure!

    override func setUp() {
        super.setUp()

        completion = {
            self.invokedCompletionClosure = true
        }

        capturedControllers = [customController, plainController, subController, emptyController]
        for controller in capturedControllers {
            controller.setShouldForwardMethodCallWithSelector("performSegueWithIdentifier:sender:", false)
            controller.setShouldForwardMethodCallWithSelector("presentViewController:animated:completion:", false)
            controller.setShouldForwardMethodCallWithSelector("showViewController:sender:", false)
            controller.setShouldForwardMethodCallWithSelector("showDetailViewController:sender:", false)
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewControllerShimForwarding() {
        let controller = UIViewController()
        XCTAssertTrue(controller.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(controller.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        controller.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(controller.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
        controller.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(controller.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testPerformSegueWithIdentifierCall() {
        for controller in capturedControllers {
            XCTAssertFalse(controller.performSegueWithIdentifierCalled, "The controller should not indicate having had performSegueWithIdentifier called by default")
            XCTAssertNil(controller.performSegueWithIdentifierSegueIdentifier, "The segue identifier to perform should be missing by default")
            XCTAssertNil(controller.performSegueWithIdentifierSender, "The sender asking to perform the segue should be missing by default")

            controller.performSegueWithIdentifier("Sample Segue", sender: self)
            XCTAssertTrue(controller.performSegueWithIdentifierCalled, "The controller should now indicate having had performSegueWithIdentifier called on it")
            XCTAssertEqual(controller.performSegueWithIdentifierSegueIdentifier!, "Sample Segue", "The identifier of the segue to perform should be captured")
            XCTAssertTrue(controller.performSegueWithIdentifierSender === self, "The sender asking to perform the segue should be captured")
        }
    }

    func testPresentViewControllerCall() {
        for controller in capturedControllers {
            XCTAssertFalse(controller.presentViewControllerCalled, "The controller should not indicate having had presentViewController called by default")
            XCTAssertNil(controller.viewControllerToPresent, "The view controller to present should be missing by default")
            XCTAssertNil(controller.presentViewControllerAnimated, "The animation flag should be missing by default")
            XCTAssertTrue(controller.presentViewControllerCompletion == nil, "The presentation completion closure should be missing by default")

            let presentable = GoodViewController()
            controller.presentViewController(presentable, animated: true, completion: completion)
            XCTAssertTrue(controller.presentViewControllerCalled, "The controller should now indicate having had presentViewController called")
            XCTAssertEqual(controller.viewControllerToPresent!, presentable, "The view controller to present should be captured")
            XCTAssertTrue(controller.presentViewControllerAnimated!, "The animation flag should be captured")
            XCTAssertTrue(controller.presentViewControllerCompletion != nil, "The presentation completion closure should be captured")
            controller.presentViewControllerCompletion!()
            XCTAssertTrue(invokedCompletionClosure, "The presentation completion closure should be captured")
        }
    }

    func testDismissViewControllerCall() {
        for controller in capturedControllers {
            XCTAssertFalse(controller.dismissViewControllerCalled, "The controller should not indicate having had dismissViewController called by default")
            XCTAssertNil(controller.dismissViewControllerAnimated, "The animation flag should be missing by default")
            XCTAssertTrue(controller.dismissViewControllerCompletion == nil, "The dismissal completion closure should be missing by default")

            controller.dismissViewControllerAnimated(true, completion: completion)
            XCTAssertTrue(controller.dismissViewControllerCalled, "The controller should now indicate having had dismissViewController called")
            XCTAssertTrue(controller.dismissViewControllerAnimated!, "The animation flag should be captured")
            XCTAssertTrue(controller.dismissViewControllerCompletion != nil, "The dismissal completion closure should be captured")
            controller.dismissViewControllerCompletion!()
            XCTAssertTrue(invokedCompletionClosure, "The dismissal completion closure should be captured")
        }
    }

    func testShowViewControllerCall() {
        for controller in capturedControllers {
            XCTAssertFalse(controller.showViewControllerCalled, "The controller should not indicate having had showViewController called by default")
            XCTAssertNil(controller.viewControllerToShow, "The view controller to show should be missing by default")
            XCTAssertNil(controller.showViewControllerSender, "The sender asking to show the view controller should be missing by default")

            let sampleController = UIViewController()
            controller.showViewController(sampleController, sender: self)
            XCTAssertTrue(controller.showViewControllerCalled, "The controller should now indicate having had showViewController called")
            XCTAssertEqual(controller.viewControllerToShow!, sampleController, "The view controller to show should be captured")
            XCTAssertTrue(controller.showViewControllerSender === self, "The sender asking to show the view controller should be captured")
        }
    }

    func testShowDetailViewControllerCall() {
        for controller in capturedControllers {
            XCTAssertFalse(controller.showDetailViewControllerCalled, "The controller should not indicate having had showDetailViewController called by default")
            XCTAssertNil(controller.detailViewControllerToShow, "The view controller to show should be missing by default")
            XCTAssertNil(controller.showDetailViewControllerSender, "The sender asking to show the view controller should be missing by default")

            let sampleController = UIViewController()
            controller.showDetailViewController(sampleController, sender: self)
            XCTAssertTrue(controller.showDetailViewControllerCalled, "The controller should now indicate having had showDetailViewController called")
            XCTAssertEqual(controller.detailViewControllerToShow!, sampleController, "The view controller to show should be captured")
            XCTAssertTrue(controller.showDetailViewControllerSender === self, "The sender asking to show the view controller should be captured")
        }
    }

}
