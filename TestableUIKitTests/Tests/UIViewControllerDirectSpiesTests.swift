//
//  UIViewControllerDirectSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/27/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import FoundationSwagger
import TestableUIKit


class TestViewController: UIViewController {

    final var performSegueTestMethodCalled = false
    dynamic override func performSegue(withIdentifier identiier: String, sender: Any? = nil) {
        performSegueTestMethodCalled = true
    }

}


class UIViewControllerDirectSpiesTests: XCTestCase {

    let controller = TestViewController()
    let rootViewController = UIApplication.rootViewController

    var animationsClosureInvoked = false
    var animations: UIViewAnimations!

    var completionHandlerInvoked = false
    var completion: UIViewAnimationsCompletion!

    override func setUp() {
        super.setUp()

        animations = {
            self.animationsClosureInvoked = true
        }

        completion = { _ in
            self.completionHandlerInvoked = true
        }

        UIApplication.rootViewController = controller
    }

    override func tearDown() {
        UIApplication.rootViewController = rootViewController

        super.tearDown()
    }


    // MARK: - `performSegue(withIdentifier:sender:)`

    func testPerformSegueControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.PerformSegueSpyController.forwardsInvocations,
                       "Spies on `setViewControllers(_:animated:)` should always forward their method invocations")
    }

    func testSpyingOnPerformSegue() {
        controller.performSegueTestMethodCalled = false
        XCTAssertFalse(controller.performSegueCalled,
                       "By default the controller should not indicate having been asked to perform a segue")
        XCTAssertNil(controller.performSegueIdentifier,
                     "By default there should be no captured identifier")
        XCTAssertNil(controller.performSegueSender, "By default there should be no captured sender")

        let spy = UIViewController.PerformSegueSpyController.createSpy(on: controller)!
        spy.beginSpying()

        controller.performSegue(withIdentifier: "foo", sender: self)

        XCTAssertTrue(controller.performSegueCalled,
                      "The controller should indicate having been asked to perform a segue")
        XCTAssertEqual(controller.performSegueIdentifier, "foo",
                       "The segue identifier should be captured")
        XCTAssertTrue(controller.performSegueSender as! XCTestCase === self,
                      "The sender should be captured")
        XCTAssertTrue(controller.performSegueTestMethodCalled,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.performSegueCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.performSegueIdentifier,
                     "The identifier should be cleared after spying is complete")
        XCTAssertNil(controller.performSegueSender,
                     "The sender should be cleared after spying is complete")
    }


    // MARK: - `present(_:animated:completion:)`

    func testSpyingOnPresentWithoutForwarding() {
        XCTAssertFalse(controller.presentCalled,
                       "By default the controller should not indicate having been asked to present a view controller")
        XCTAssertNil(controller.presentController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.presentAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.presentCompletion,
                     "By default there should be no captured completion handler")

        UIViewController.PresentSpyController.forwardsInvocations = false
        let spy = UIViewController.PresentSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let presentable = UIViewController()

        controller.present(presentable, animated: true) {
            self.completionHandlerInvoked = true
        }

        XCTAssertTrue(controller.presentCalled,
                      "The controller should indicate having been asked to present a view controller")
        XCTAssertEqual(controller.presentController, presentable,
                       "The view controller should be captured")
        XCTAssertTrue(controller.presentAnimated!, "The animation flag should be captured")

        XCTAssertNil(controller.presentedViewController,
                     "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        let capturedCompletion = controller.presentCompletion
        capturedCompletion!()
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(controller.presentCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.presentController,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.presentAnimated,
                     "The animation flag should be cleared after spying is complete")
        XCTAssertNil(controller.presentCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnPresentWithForwarding() {
        XCTAssertFalse(controller.presentCalled,
                       "By default the controller should not indicate having been asked to present anything")
        XCTAssertNil(controller.presentController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.presentAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.presentCompletion,
                     "By default there should be no captured completion handler")

        UIViewController.PresentSpyController.forwardsInvocations = true
        let spy = UIViewController.PresentSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let presentable = UIViewController()

        controller.present(presentable, animated: true, completion: {})

        XCTAssertTrue(controller.presentCalled,
                      "The controller should indicate having been asked to perform a segue")
        XCTAssertEqual(controller.presentController, presentable,
                       "The view controller should be captured")
        XCTAssertTrue(controller.presentAnimated!, "The animation flag should be captured")
        XCTAssertNil(controller.presentCompletion,
                     "The completion handler should not be captured when forwarding the method invocation")
        XCTAssertEqual(controller.presentedViewController, presentable,
                     "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.presentCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.presentController,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.presentAnimated,
                     "The animation flag should be cleared after spying is complete")
    }


    // MARK: - `dismiss(animated:completion:)`

    func testSpyingOnDismissWithoutForwarding() {
        XCTAssertFalse(controller.dismissCalled,
                       "By default the controller should not indicate having been asked to dismiss a presented view controller")
        XCTAssertNil(controller.dismissAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.dismissCompletion,
                     "By default there should be no captured completion handler")

        let dismissable = UIViewController()
        controller.present(dismissable, animated: false)

        UIViewController.DismissSpyController.forwardsInvocations = false
        let spy = UIViewController.DismissSpyController.createSpy(on: controller)!
        spy.beginSpying()

        controller.dismiss(animated: true) {
            self.completionHandlerInvoked = true
        }

        XCTAssertTrue(controller.dismissCalled,
                      "The controller should indicate having been asked to perform a segue")
        XCTAssertTrue(controller.dismissAnimated!, "The animation flag should be captured")

        XCTAssertEqual(controller.presentedViewController, dismissable,
                     "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        let capturedCompletion = controller.dismissCompletion
        capturedCompletion!()
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(controller.dismissCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.dismissAnimated,
                     "The animation flag should be cleared after spying is complete")
        XCTAssertNil(controller.dismissCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnDismissWithForwarding() {
        XCTAssertFalse(controller.dismissCalled,
                       "By default the controller should not indicate having been asked to dismiss a presented view controller")
        XCTAssertNil(controller.dismissAnimated,
                     "By default there should be no captured animation flag")
        XCTAssertNil(controller.dismissCompletion,
                     "By default there should be no captured completion handler")

        UIViewController.DismissSpyController.forwardsInvocations = true
        let spy = UIViewController.DismissSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let dismissable = UIViewController()
        controller.present(dismissable, animated: false)

        let predicate = NSPredicate { [controller] _ in
            return controller.presentedViewController == nil
        }
        _ = expectation(for: predicate, evaluatedWith: [:])

        controller.dismiss(animated: true, completion: {})

        XCTAssertTrue(controller.dismissCalled,
                      "The controller should indicate having been asked to perform a segue")
        XCTAssertTrue(controller.dismissAnimated!, "The animation flag should be captured")
        XCTAssertNil(controller.dismissCompletion,
                     "The completion handler should not be captured when forwarding the method invocation")

        waitForExpectations(timeout: 2) { [controller] _ in
            XCTAssertNil(controller.presentedViewController,
                         "The spy method should forward the method call to the original implementation")
        }

        spy.endSpying()

        XCTAssertFalse(controller.dismissCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.dismissAnimated,
                     "The animation flag should be cleared after spying is complete")
        XCTAssertNil(controller.dismissCompletion,
                     "The completion handler should be cleared after spying is complete")
    }


    // MARK: - `show(_:sender:)` and `showDetailViewController(_:sender:)`

    func testShowSpyControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ShowSpyController.forwardsInvocations,
                      "Spies on `show(_:sender:)` and `showDetailViewController(_:sender:)` should always forward their method invocations")
    }

    func testSpyingOnShow() {
        XCTAssertFalse(controller.showCalled,
                       "By default the controller should not indicate having been asked to show a view controller")
        XCTAssertNil(controller.showController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.showSender, "By default there should be no captured sender")

        let spy = UIViewController.ShowSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let showable = UIViewController()
        controller.show(showable, sender: self)

        XCTAssertTrue(controller.showCalled,
                      "The controller should indicate having been asked to show a view controller")
        XCTAssertEqual(controller.showController, showable,
                       "The view controller should be captured")
        XCTAssertTrue(controller.showSender as! XCTestCase === self,
                      "The sender should be captured")
        XCTAssertEqual(controller.presentedViewController, showable,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.showCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.showController,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.showSender,
                     "The sender should be cleared after spying is complete")
    }

    func testSpyingOnShowDetailViewController() {
        XCTAssertFalse(controller.showCalled,
                       "By default the controller should not indicate having been asked to show a detail view controller")
        XCTAssertNil(controller.showController,
                     "By default there should be no captured view controller")
        XCTAssertNil(controller.showSender, "By default there should be no captured sender")

        let spy = UIViewController.ShowSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let showable = UIViewController()
        controller.showDetailViewController(showable, sender: self)

        XCTAssertTrue(controller.showCalled,
                      "The controller should indicate having been asked to show a detail view controller")
        XCTAssertEqual(controller.showController, showable,
                       "The view controller should be captured")
        XCTAssertTrue(controller.showSender as! XCTestCase === self,
                      "The sender should be captured")
        XCTAssertEqual(controller.presentedViewController, showable,
                       "The spy method should forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(controller.showCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.showController,
                     "The view controller should be cleared after spying is complete")
        XCTAssertNil(controller.showSender,
                     "The sender should be cleared after spying is complete")
    }


    // MARK: - `transition(from:to:duration:options:animations:completion:)`

    func testTransitionSpyControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.TransitionDirectSpyController.forwardsInvocations,
                      "Spies on `transition(from:to:duration:options:animations:completion:)` should forward their method invocations by default")
    }

    func testSpyingOnTransitionWithoutForwarding() {
        XCTAssertFalse(controller.transitionCalled,
                       "By default the controller should not indicate having been asked to transition between child view controllers")
        XCTAssertNil(controller.transitionFromController,
                     "By default there should be no captured source controller")
        XCTAssertNil(controller.transitionToController,
                     "By default there should be no captured destination controller")
        XCTAssertNil(controller.transitionDuration,
                     "By default there should be no captured duration")
        XCTAssertNil(controller.transitionOptions,
                     "By default there should be no captured options")
        XCTAssertNil(controller.transitionAnimations,
                     "By default there should be no captured animation closure")
        XCTAssertNil(controller.transitionCompletion,
                     "By default there should be no captured completion handler")

        UIViewController.TransitionDirectSpyController.forwardsInvocations = false
        defer {
            UIViewController.TransitionDirectSpyController.forwardsInvocations = true
        }

        let spy = UIViewController.TransitionDirectSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let source = UIViewController()
        controller.addChildViewController(source)

        let destination = UIViewController()
        controller.addChildViewController(destination)
        
        let options: UIViewAnimationOptions = [.allowAnimatedContent, .allowUserInteraction]

        controller.transition(
            from: source,
            to: destination,
            duration: 0.14,
            options: options,
            animations: animations,
            completion: completion
        )

        XCTAssertTrue(controller.transitionCalled,
                      "The controller should indicate having been asked to transition between child view controllers")
        XCTAssertEqual(controller.transitionFromController, source,
                       "The source view controller should be captured")
        XCTAssertEqual(controller.transitionToController, destination,
                       "The destination view controller should be captured")
        XCTAssertEqual(controller.transitionDuration, 0.14, "The duration should be captured")
        XCTAssertEqual(controller.transitionOptions, options,
                       "The animation options should be captured")

        guard let capturedAnimations = controller.transitionAnimations,
            !animationsClosureInvoked
            else {
            return XCTFail("The animations closure should be captured and not invoked when forwarding is disabled")
        }

        capturedAnimations()
        XCTAssertTrue(animationsClosureInvoked, "The animations closure should be captured")

        guard let capturedCompletion = controller.transitionCompletion,
            !completionHandlerInvoked
            else {
                return XCTFail("The completion handler should be captured and not invoked when forwarding is disabled")
        }

        capturedCompletion(true)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(controller.transitionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.transitionFromController,
                     "The source controller should be cleared after spying is complete")
        XCTAssertNil(controller.transitionToController,
                     "The destination controller should be cleared after spying is complete")
        XCTAssertNil(controller.transitionDuration,
                     "The duration should be cleared after spying is complete")
        XCTAssertNil(controller.transitionOptions,
                     "The options should be cleared after spying is complete")
        XCTAssertNil(controller.transitionAnimations,
                     "The animations closure should be cleared after spying is complete")
        XCTAssertNil(controller.transitionCompletion,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnTransitionWithForwarding() {
        XCTAssertFalse(controller.transitionCalled,
                       "By default the controller should not indicate having been asked to transition between child view controllers")
        XCTAssertNil(controller.transitionFromController,
                     "By default there should be no captured source controller")
        XCTAssertNil(controller.transitionToController,
                     "By default there should be no captured destination controller")
        XCTAssertNil(controller.transitionDuration,
                     "By default there should be no captured duration")
        XCTAssertNil(controller.transitionOptions,
                     "By default there should be no captured options")
        XCTAssertNil(controller.transitionAnimations,
                     "By default there should be no captured animation closure")
        XCTAssertNil(controller.transitionCompletion,
                     "By default there should be no captured completion handler")

        let spy = UIViewController.TransitionDirectSpyController.createSpy(on: controller)!
        spy.beginSpying()

        let source = UIViewController()
        controller.addChildViewController(source)

        let destination = UIViewController()
        controller.addChildViewController(destination)

        let options: UIViewAnimationOptions = [.allowAnimatedContent, .allowUserInteraction]

        controller.transition(
            from: source,
            to: destination,
            duration: 0.14,
            options: options,
            animations: animations,
            completion: completion
        )

        XCTAssertTrue(controller.transitionCalled,
                      "The controller should indicate having been asked to transition between child view controllers")
        XCTAssertEqual(controller.transitionFromController, source,
                       "The source view controller should be captured")
        XCTAssertEqual(controller.transitionToController, destination,
                       "The destination view controller should be captured")
        XCTAssertEqual(controller.transitionDuration, 0.14, "The duration should be captured")
        XCTAssertEqual(controller.transitionOptions, options,
                       "The animation options should be captured")
        XCTAssertNil(controller.transitionAnimations,
                     "The animations closure should not be captured when forwarding is enabled")
        XCTAssertNil(controller.transitionCompletion,
                     "The completion handler should not be captured when forwarding is enabled")

        spy.endSpying()

        XCTAssertFalse(controller.transitionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(controller.transitionFromController,
                     "The source controller should be cleared after spying is complete")
        XCTAssertNil(controller.transitionToController,
                     "The destination controller should be cleared after spying is complete")
        XCTAssertNil(controller.transitionDuration,
                     "The duration should be cleared after spying is complete")
        XCTAssertNil(controller.transitionOptions,
                     "The options should be cleared after spying is complete")
        XCTAssertNil(controller.transitionAnimations,
                     "The animations closure should be cleared after spying is complete")
        XCTAssertNil(controller.transitionCompletion,
                     "The completion handler should be cleared after spying is complete")
    }
    
}
