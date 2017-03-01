//
//  UIViewControllerIndirectSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import SampleTypes
import TestableUIKit


class UIViewControllerIndirectSpiesTests: XCTestCase {

    let plainController = PlainController()
    let compliantController = CompliantController()
    let subCompliantController = CompliantControllerSubclass()
    let nonCompliantController = NonCompliantController()

    var compliantControllers: [UIViewController]!

    let sourceController = UIViewController()
    let destinationController = UIViewController()
    let duration = 0.111
    let options = UIViewAnimationOptions.curveEaseIn

    var animationsClosureInvoked = false
    var animations: UIViewAnimations!

    var completionHandlerInvoked = false
    var completion: UIViewAnimationsCompletion!

    override func setUp() {
        super.setUp()

        compliantControllers = [
            plainController,
            compliantController,
            subCompliantController
        ]

        animations = { [weak self] in
            self?.animationsClosureInvoked = true
        }

        completion = { [weak self] _ in
            self?.completionHandlerInvoked = true
        }
    }


    // MARK: - `loadView`

    func testLoadViewControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.LoadViewSpyController.forwardsInvocations,
                      "Spies on `loadView` should always forward their method invocations")
    }

    func testLoadViewSpyWithCompliantControllers() {
        subCompliantController.compliantControllerSubclassLoadViewCalled = false

        [compliantController, subCompliantController].forEach { controller in
            XCTAssertFalse(controller.superclassLoadViewCalled,
                           "By default the controller should not indicate having asked its superclass to load its view")

            let spy = UIViewController.LoadViewSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.loadView()
            XCTAssertFalse(controller.superclassLoadViewCalled,
                           "A `UIViewController` subclass that does not call its superclass's implementation of `loadView` should not indicate having called that method when being spied upon")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerSubclassLoadViewCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassLoadViewCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testLoadViewSpyWithNonCompliantController() {
        let spy = UIViewController.LoadViewSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.loadView()
        XCTAssertTrue(nonCompliantController.superclassLoadViewCalled,
                      "A `UIViewController` subclass that calls its superclass implementation of `loadView` should indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `viewDidLoad`

    func testViewDidLoadControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ViewDidLoadSpyController.forwardsInvocations,
                      "Spies on `viewDidLoad` should always forward their method invocations")
    }

    func testViewDidLoadSpyWithCompliantControllers() {
        subCompliantController.compliantControllerViewDidLoadCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassViewDidLoadCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `viewDidLoad`")

            let spy = UIViewController.ViewDidLoadSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.viewDidLoad()
            XCTAssertTrue(controller.superclassViewDidLoadCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `viewDidLoad` should indicate having called that method when being spied upon")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerViewDidLoadCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassViewDidLoadCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testViewDidLoadSpyWithNonCompliantController() {
        let spy = UIViewController.ViewDidLoadSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.viewDidLoad()
        XCTAssertFalse(nonCompliantController.superclassViewDidLoadCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `viewDidLoad` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `viewWillAppear(_:)`

    func testViewWillAppearControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ViewWillAppearSpyController.forwardsInvocations,
                      "Spies on `viewWillAppear(_:)` should always forward their method invocations")
    }

    func testViewWillAppearSpyWithCompliantControllers() {
        subCompliantController.compliantControllerViewWillAppearCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassViewWillAppearCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `viewWillAppear(_:)`")
            XCTAssertNil(controller.superclassViewWillAppearAnimated,
                         "By default the animation flag should be clear")

            let spy = UIViewController.ViewWillAppearSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.viewWillAppear(true)
            XCTAssertTrue(controller.superclassViewWillAppearCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `viewWillAppear(_:)` should indicate having called that method when being spied upon")
            XCTAssertTrue(controller.superclassViewWillAppearAnimated!,
                         "The animation flag should be captured")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerViewWillAppearCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassViewWillAppearCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassViewWillAppearAnimated,
                         "The flag should be cleared after spying is complete")
        }
    }

    func testViewWillAppearSpyWithNonCompliantController() {
        let spy = UIViewController.ViewWillAppearSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.viewWillAppear(true)
        XCTAssertFalse(nonCompliantController.superclassViewWillAppearCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `viewWillAppear(_:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `viewDidAppear(_:)`

    func testViewDidAppearControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ViewDidAppearSpyController.forwardsInvocations,
                      "Spies on `viewDidAppear(_:)` should always forward their method invocations")
    }

    func testViewDidAppearSpyWithCompliantControllers() {
        subCompliantController.compliantControllerViewDidAppearCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassViewDidAppearCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `viewDidAppear(_:)`")
            XCTAssertNil(controller.superclassViewDidAppearAnimated,
                         "By default the animation flag should be clear")

            let spy = UIViewController.ViewDidAppearSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.viewDidAppear(true)
            XCTAssertTrue(controller.superclassViewDidAppearCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `viewDidAppear(_:)` should indicate having called that method when being spied upon")
            XCTAssertTrue(controller.superclassViewDidAppearAnimated!,
                          "The animation flag should be captured")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerViewDidAppearCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassViewDidAppearCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassViewDidAppearAnimated,
                         "The flag should be cleared after spying is complete")
        }
    }

    func testViewDidAppearSpyWithNonCompliantController() {
        let spy = UIViewController.ViewDidAppearSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.viewDidAppear(true)
        XCTAssertFalse(nonCompliantController.superclassViewDidAppearCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `viewDidAppear(_:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `viewWillDisappear(_:)`

    func testViewWillDisappearControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ViewWillDisappearSpyController.forwardsInvocations,
                      "Spies on `viewWillDisappear(_:)` should always forward their method invocations")
    }

    func testViewWillDisappearSpyWithCompliantControllers() {
        subCompliantController.compliantControllerViewWillDisappearCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassViewWillDisappearCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `viewWillDisappear(_:)`")
            XCTAssertNil(controller.superclassViewWillDisappearAnimated,
                         "By default the animation flag should be clear")

            let spy = UIViewController.ViewWillDisappearSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.viewWillDisappear(true)
            XCTAssertTrue(controller.superclassViewWillDisappearCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `viewWillDisappear(_:)` should indicate having called that method when being spied upon")
            XCTAssertTrue(controller.superclassViewWillDisappearAnimated!,
                          "The animation flag should be captured")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerViewWillDisappearCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassViewWillDisappearCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassViewWillDisappearAnimated,
                         "The flag should be cleared after spying is complete")
        }
    }

    func testViewWillDisappearSpyWithNonCompliantController() {
        let spy = UIViewController.ViewWillDisappearSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.viewWillDisappear(true)
        XCTAssertFalse(nonCompliantController.superclassViewWillDisappearCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `viewWillDisappear(_:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `viewDidDisappear(_:)`

    func testViewDidDisappearControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.ViewDidDisappearSpyController.forwardsInvocations,
                      "Spies on `viewDidDisappear(_:)` should always forward their method invocations")
    }

    func testViewDidDisappearSpyWithCompliantControllers() {
        subCompliantController.compliantControllerViewDidDisappearCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassViewDidDisappearCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `viewDidDisappear(_:)`")
            XCTAssertNil(controller.superclassViewDidDisappearAnimated,
                         "By default the animation flag should be clear")

            let spy = UIViewController.ViewDidDisappearSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.viewDidDisappear(true)
            XCTAssertTrue(controller.superclassViewDidDisappearCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `viewDidDisappear(_:)` should indicate having called that method when being spied upon")
            XCTAssertTrue(controller.superclassViewDidDisappearAnimated!,
                          "The animation flag should be captured")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerViewDidDisappearCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassViewDidDisappearCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassViewDidDisappearAnimated,
                         "The flag should be cleared after spying is complete")
        }
    }

    func testViewDidDisappearSpyWithNonCompliantController() {
        let spy = UIViewController.ViewDidDisappearSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.viewDidDisappear(true)
        XCTAssertFalse(nonCompliantController.superclassViewDidDisappearCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `viewDidDisappear(_:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `didReceiveMemoryWarning`

    func testDidReceiveMemoryWarningControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.DidReceiveMemoryWarningSpyController.forwardsInvocations,
                      "Spies on `didReceiveMemoryWarning` should always forward their method invocations")
    }

    func testDidReceiveMemoryWarningSpyWithCompliantControllers() {
        subCompliantController.compliantControllerDidReceiveMemoryWarningCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassDidReceiveMemoryWarningCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `didReceiveMemoryWarning`")

            let spy = UIViewController.DidReceiveMemoryWarningSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.didReceiveMemoryWarning()
            XCTAssertTrue(controller.superclassDidReceiveMemoryWarningCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `didReceiveMemoryWarning` should indicate having called that method when being spied upon")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerDidReceiveMemoryWarningCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassDidReceiveMemoryWarningCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testDidReceiveMemoryWarningSpyWithNonCompliantController() {
        let spy = UIViewController.DidReceiveMemoryWarningSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.didReceiveMemoryWarning()
        XCTAssertFalse(nonCompliantController.superclassDidReceiveMemoryWarningCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `didReceiveMemoryWarning` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `updateViewConstraints`

    func testUpdateViewConstraintsControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.UpdateViewConstraintsSpyController.forwardsInvocations,
                      "Spies on `updateViewConstraints` should always forward their method invocations")
    }

    func testUpdateViewConstraintsSpyWithCompliantControllers() {
        subCompliantController.compliantControllerUpdateViewConstraintsCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassUpdateViewConstraintsCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `updateViewConstraints`")

            let spy = UIViewController.UpdateViewConstraintsSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.updateViewConstraints()
            XCTAssertTrue(controller.superclassUpdateViewConstraintsCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `updateViewConstraints` should indicate having called that method when being spied upon")

            if controller === subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerUpdateViewConstraintsCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassUpdateViewConstraintsCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testUpdateViewConstraintsSpyWithNonCompliantController() {
        let spy = UIViewController.UpdateViewConstraintsSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.updateViewConstraints()
        XCTAssertFalse(nonCompliantController.superclassUpdateViewConstraintsCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `updateViewConstraints` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `addChildViewController(_:)`

    func testAddChildViewControllerControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.AddChildViewControllerSpyController.forwardsInvocations,
                      "Spies on `addChildViewController(_:)` should always forward their method invocations")
    }

    func testAddChildViewControllerSpyWithCompliantControllers() {
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassAddChildViewControllerCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `addChildViewController(_:)`")
            XCTAssertNil(controller.superclassAddChildViewControllerChild,
                         "By default the child controller should be clear")

            let spy = UIViewController.AddChildViewControllerSpyController.createSpy(on: controller)!
            spy.beginSpying()

            let child = UIViewController()
            controller.addChildViewController(child)
            XCTAssertTrue(controller.superclassAddChildViewControllerCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `addChildViewController(_:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(controller.superclassAddChildViewControllerChild!, child,
                          "The child controller should be captured")

            XCTAssertTrue(controller.childViewControllers.contains(child),
                              "The spy method should always forward the method call to the original implementation")

            spy.endSpying()

            XCTAssertFalse(controller.superclassAddChildViewControllerCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassAddChildViewControllerChild,
                         "The child should be cleared after spying is complete")
        }
    }

    func testAddChildViewControllerSpyWithNonCompliantController() {
        let child = UIViewController()
        let spy = UIViewController.AddChildViewControllerSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.addChildViewController(child)
        XCTAssertFalse(nonCompliantController.superclassAddChildViewControllerCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `addChildViewController(_:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `removeFromParentViewController`

    func testRemoveFromParentViewControllerControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.RemoveFromParentViewControllerSpyController.forwardsInvocations,
                      "Spies on `removeFromParentViewController` should always forward their method invocations")
    }

    func testRemoveFromParentViewControllerSpyWithCompliantControllers() {
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassRemoveFromParentViewControllerCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `removeFromParentViewController`")

            let spy = UIViewController.RemoveFromParentViewControllerSpyController.createSpy(on: controller)!
            spy.beginSpying()

            let child = UIViewController()
            controller.addChildViewController(child)
            assert(controller.childViewControllers.contains(child))
            controller.removeFromParentViewController()

            XCTAssertTrue(controller.superclassRemoveFromParentViewControllerCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `removeFromParentViewController` should indicate having called that method when being spied upon")

            XCTAssertFalse(!controller.childViewControllers.contains(child),
                          "The spy method should always forward the method call to the original implementation")

            spy.endSpying()

            XCTAssertFalse(controller.superclassRemoveFromParentViewControllerCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testRemoveFromParentViewControllerSpyWithNonCompliantController() {
        let spy = UIViewController.RemoveFromParentViewControllerSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.removeFromParentViewController()
        XCTAssertFalse(nonCompliantController.superclassRemoveFromParentViewControllerCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `removeFromParentViewController` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `transition(from:to:duration:options:animations:completion:)`

    func testTransitionSpyWithCompliantControllersWithoutForwarding() {

        compliantControllers.forEach { controller in
            controller.addChildViewController(sourceController)
            controller.addChildViewController(destinationController)

            XCTAssertFalse(controller.superclassTransitionCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `transition(from:to:duration:options:animations:completion:)`")
            XCTAssertNil(controller.superclassTransitionFromController,
                         "By default the source controller should be clear")
            XCTAssertNil(controller.superclassTransitionToController,
                         "By default the destination controller should be clear")
            XCTAssertNil(controller.superclassTransitionDuration,
                         "By default the duration should be clear")
            XCTAssertNil(controller.superclassTransitionOptions,
                         "By default the options should be clear")
            XCTAssertNil(controller.superclassTransitionAnimations,
                         "By default the animations closure should be clear")
            XCTAssertNil(controller.superclassTransitionCompletion,
                         "By default the completion handler should be clear")

            animationsClosureInvoked = false
            completionHandlerInvoked = false

            UIViewController.TransitionSpyController.forwardsInvocations = false
            let spy = UIViewController.TransitionSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.transition(
                from: sourceController,
                to: destinationController,
                duration: duration,
                options: options,
                animations: animations,
                completion: completion
            )

            XCTAssertTrue(controller.superclassTransitionCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `transition(from:to:duration:options:animations:completion:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(controller.superclassTransitionFromController!, sourceController,
                           "The source controller should be captured")
            XCTAssertEqual(controller.superclassTransitionToController!, destinationController,
                           "The destination controller should be captured")
            XCTAssertEqual(controller.superclassTransitionDuration!, duration,
                           "The duration should be captured")
            XCTAssertEqual(controller.superclassTransitionOptions!, options,
                           "The options should be captured")

            XCTAssertFalse(animationsClosureInvoked,
                           "The spy method should not forward the method call to the original implementation")
            let capturedAnimations = controller.superclassTransitionAnimations
            capturedAnimations!()
            XCTAssertTrue(animationsClosureInvoked, "The animations closure should be captured")

            XCTAssertFalse(completionHandlerInvoked,
                           "The spy method should not forward the method call to the original implementation")
            let capturedCompletion = controller.superclassTransitionCompletion
            capturedCompletion!(true)
            XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

            spy.endSpying()

            XCTAssertFalse(controller.superclassTransitionCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionFromController,
                         "The source controller should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionToController,
                         "The destination controller should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionDuration,
                         "The duration should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionOptions,
                         "The options should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionAnimations,
                         "The animations closure should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionCompletion,
                         "The completion handler should be cleared after spying is complete")
        }
    }

    func testTransitionSpyWithCompliantControllersWithForwarding() {

        compliantControllers.forEach { controller in
            controller.addChildViewController(sourceController)
            controller.addChildViewController(destinationController)

            XCTAssertFalse(controller.superclassTransitionCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `transition(from:to:duration:options:animations:completion:)`")
            XCTAssertNil(controller.superclassTransitionFromController,
                         "By default the source controller should be clear")
            XCTAssertNil(controller.superclassTransitionToController,
                         "By default the destination controller should be clear")
            XCTAssertNil(controller.superclassTransitionDuration,
                         "By default the duration should be clear")
            XCTAssertNil(controller.superclassTransitionOptions,
                         "By default the options should be clear")
            XCTAssertNil(controller.superclassTransitionAnimations,
                         "By default the animations closure should be clear")
            XCTAssertNil(controller.superclassTransitionCompletion,
                         "By default the completion handler should be clear")

            animationsClosureInvoked = false
            completionHandlerInvoked = false

            UIViewController.TransitionSpyController.forwardsInvocations = true
            let spy = UIViewController.TransitionSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.transition(
                from: sourceController,
                to: destinationController,
                duration: duration,
                options: options,
                animations: animations,
                completion: completion
            )

            XCTAssertTrue(controller.superclassTransitionCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `transition(from:to:duration:options:animations:completion:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(controller.superclassTransitionFromController!, sourceController,
                           "The source controller should be captured")
            XCTAssertEqual(controller.superclassTransitionToController!, destinationController,
                           "The destination controller should be captured")
            XCTAssertEqual(controller.superclassTransitionDuration!, duration,
                           "The duration should be captured")
            XCTAssertEqual(controller.superclassTransitionOptions!, options,
                           "The options should be captured")

            XCTAssertNil(controller.superclassTransitionAnimations,
                         "The animations closure should not be captured when forwarding to the original implementation")
            XCTAssertNil(controller.superclassTransitionCompletion,
                         "The completion handler should not be captured when forwarding to the original implementation")

            if controller == subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerTransitionCalled,
                               "The spy method should not forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassTransitionCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionFromController,
                         "The source controller should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionToController,
                         "The destination controller should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionDuration,
                         "The duration should be cleared after spying is complete")
            XCTAssertNil(controller.superclassTransitionOptions,
                         "The options should be cleared after spying is complete")
        }
    }

    func testTransitionSpyWithNonCompliantController() {
        let spy = UIViewController.TransitionSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.transition(
            from: sourceController,
            to: destinationController,
            duration: duration,
            options: options,
            animations: animations,
            completion: completion
        )

        XCTAssertFalse(nonCompliantController.superclassTransitionCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `transition(from:to:duration:options:animations:completion:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `setEditing(_:animated:)`

    func testSetEditingControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.SetEditingSpyController.forwardsInvocations,
                      "Spies on `setEditing(_:animated:)` should always forward their method invocations")
    }

    func testSetEditingSpyWithCompliantControllers() {
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassSetEditingCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `setEditing(_:animated:)`")
            XCTAssertNil(controller.superclassSetEditingEditing,
                         "By default the editing flag should be clear")
            XCTAssertNil(controller.superclassSetEditingAnimated,
                         "By default the animation flag should be clear")

            let spy = UIViewController.SetEditingSpyController.createSpy(on: controller)!
            spy.beginSpying()

            controller.setEditing(true, animated: true)
            XCTAssertTrue(controller.superclassSetEditingCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `setEditing(_:animated:)` should indicate having called that method when being spied upon")
            XCTAssertTrue(controller.superclassSetEditingEditing!,
                          "The editing flag should be captured")
            XCTAssertTrue(controller.superclassSetEditingAnimated!,
                          "The animation flag should be captured")
            XCTAssertTrue(controller.isEditing,
                          "The spy method should always forward the method call to the original implementation")

            spy.endSpying()

            XCTAssertFalse(controller.superclassSetEditingCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassSetEditingEditing,
                         "The editing flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassSetEditingAnimated,
                         "The animation flag should be cleared after spying is complete")

            controller.setEditing(false, animated: true)
        }
    }

    func testSetEditingSpyWithNonCompliantController() {
        let spy = UIViewController.SetEditingSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.setEditing(true, animated: true)
        XCTAssertFalse(nonCompliantController.superclassSetEditingCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `setEditing(_:animated:)` should not indicate having called that method when being spied upon")

        spy.endSpying()

        nonCompliantController.setEditing(false, animated: true)
    }


    // MARK: - `encodeRestorableState(with:)`

    func testEncodeRestorableStateControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.EncodeRestorableStateSpyController.forwardsInvocations,
                      "Spies on `encodeRestorableState(with:)` should always forward their method invocations")
    }

    func testEncodeRestorableStateSpyWithCompliantControllers() {
        subCompliantController.compliantControllerEncodeRestorableStateCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassEncodeRestorableStateCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `encodeRestorableState(with:)`")
            XCTAssertNil(controller.superclassEncodeRestorableStateCoder,
                         "By default the coder should be clear")

            let spy = UIViewController.EncodeRestorableStateSpyController.createSpy(on: controller)!
            spy.beginSpying()

            let coder = NSCoder()
            controller.encodeRestorableState(with: coder)
            XCTAssertTrue(controller.superclassEncodeRestorableStateCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `encodeRestorableState(with:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(controller.superclassEncodeRestorableStateCoder!, coder,
                          "The coder should be captured")

            if controller == subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerEncodeRestorableStateCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassEncodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassEncodeRestorableStateCoder,
                         "The coder should be cleared after spying is complete")
        }
    }

    func testEncodeRestorableStateSpyWithNonCompliantController() {
        let spy = UIViewController.EncodeRestorableStateSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.encodeRestorableState(with: NSCoder())
        XCTAssertFalse(nonCompliantController.superclassEncodeRestorableStateCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `encodeRestorableState(with:)` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `decodeRestorableState(with:)`

    func testDecodeRestorableStateControllerForwardingBehavior() {
        XCTAssertTrue(UIViewController.DecodeRestorableStateSpyController.forwardsInvocations,
                      "Spies on `decodeRestorableState(with:)` should always forward their method invocations")
    }

    func testDecodeRestorableStateSpyWithCompliantControllers() {
        subCompliantController.compliantControllerDecodeRestorableStateCalled = false
        compliantControllers.forEach { controller in
            XCTAssertFalse(controller.superclassDecodeRestorableStateCalled,
                           "By default the controller should not indicate having invoked its superclass's implementation of `decodeRestorableState(with:)`")
            XCTAssertNil(controller.superclassDecodeRestorableStateCoder,
                         "By default the coder should be clear")

            let spy = UIViewController.DecodeRestorableStateSpyController.createSpy(on: controller)!
            spy.beginSpying()

            let coder = NSCoder()
            controller.decodeRestorableState(with: coder)
            XCTAssertTrue(controller.superclassDecodeRestorableStateCalled,
                          "A `UIViewController` subclass that calls its superclass's implementation of `decodeRestorableState(with:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(controller.superclassDecodeRestorableStateCoder!, coder,
                           "The coder should be captured")

            if controller == subCompliantController {
                XCTAssertTrue(subCompliantController.compliantControllerDecodeRestorableStateCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(controller.superclassDecodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(controller.superclassDecodeRestorableStateCoder,
                         "The coder should be cleared after spying is complete")
        }
    }

    func testDecodeRestorableStateSpyWithNonCompliantController() {
        let spy = UIViewController.DecodeRestorableStateSpyController.createSpy(on: nonCompliantController)!
        spy.beginSpying()

        nonCompliantController.decodeRestorableState(with: NSCoder())
        XCTAssertFalse(nonCompliantController.superclassDecodeRestorableStateCalled,
                       "A `UIViewController` subclass that does not call its superclass implementation of `decodeRestorableState(with:)` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }

}
