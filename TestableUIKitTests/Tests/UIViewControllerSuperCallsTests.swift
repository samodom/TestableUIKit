//
//  UIViewControllerSuperCallsTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/19/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit

class UIViewControllerSuperCallsTests: XCTestCase {

    let goodController = GoodViewController()
    let emptyController = EmptyViewController()
    let subController = GoodViewControllerSubclass()
    let plainController = UIViewController()
    let badController = BadViewController()
    let childController = EmptyViewController()
    var callingControllers = [UIViewController]()

    let animationOptions = UIViewAnimationOptions.BeginFromCurrentState | UIViewAnimationOptions.Autoreverse
    var invokedAnimationClosure = false
    var animations: UIViewAnimationsClosure!
    var invokedCompletionClosure = false
    var completion: UIViewAnimationCompletionClosure!

    override func setUp() {
        super.setUp()

        animations = {
            self.invokedAnimationClosure = true
        }

        completion = { _ in
            self.invokedCompletionClosure = true
        }

        callingControllers += [goodController, emptyController, subController, plainController]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(plainController.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(plainController.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        plainController.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(plainController.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        plainController.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(plainController.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testGoodLoadViewSuperCall() {
        let noncallingControllers = [goodController, subController]
        for controller in noncallingControllers {
            controller.loadView()
            XCTAssertFalse(controller.calledLoadView, "The superclass's loadView method should never be called by a subclassing controller")
        }
    }

    func testBadLoadViewSuperCall() {
        callingControllers = [badController, emptyController, plainController]
        for controller in callingControllers {
            controller.loadView()
            XCTAssertTrue(controller.calledLoadView, "The superclass's loadView method should never be called by a subclassing controller")
        }
    }

    func testGoodViewDidLoadSuperCall() {
        for controller in callingControllers {
            controller.viewDidLoad()
            XCTAssertTrue(controller.calledViewDidLoad, "The superclass's viewDidLoad method should be called by the controller")
        }
    }

    func testBadViewDidLoadSuperCall() {
        badController.viewDidLoad()
        XCTAssertFalse(badController.calledViewDidLoad, "The superclass's viewDidLoad method is not called by the bad subclass")
    }

    func testGoodViewWillAppearSuperCall() {
        for controller in callingControllers {
            controller.viewWillAppear(true)
            XCTAssertTrue(controller.calledViewWillAppear, "The superclass's viewWillAppear method should be called by the controller")
            XCTAssertTrue(controller.viewWillAppearAnimated!, "The superclass's viewWillAppear method should be passed the animated flag")

            controller.calledViewWillAppear = false
            controller.viewWillAppearAnimated = true
            controller.viewWillAppear(false)
            XCTAssertTrue(controller.calledViewWillAppear, "The superclass's viewWillAppear method should be called by the controller")
            XCTAssertFalse(controller.viewWillAppearAnimated!, "The superclass's viewWillAppear method should be passed the animated flag")
        }
    }

    func testBadViewWillAppearSuperCall() {
        badController.viewWillAppear(true)
        XCTAssertFalse(badController.calledViewWillAppear, "The superclass's viewWillAppear method is not called by the bad subclass")
        XCTAssertNil(badController.viewWillAppearAnimated, "The animated flag should still be missing")
    }

    func testGoodViewDidAppearSuperCall() {
        for controller in callingControllers {
            controller.viewDidAppear(true)
            XCTAssertTrue(controller.calledViewDidAppear, "The superclass's viewDidAppear method should be called by the controller")
            XCTAssertTrue(controller.viewDidAppearAnimated!, "The superclass's viewDidAppear method should be passed the animated flag")

            controller.calledViewDidAppear = false
            controller.viewDidAppearAnimated = true
            controller.viewDidAppear(false)
            XCTAssertTrue(controller.calledViewDidAppear, "The superclass's viewDidAppear method should be called by the controller")
            XCTAssertFalse(controller.viewDidAppearAnimated!, "The superclass's viewDidAppear method should be passed the animated flag")
        }
    }

    func testBadViewDidAppearSuperCall() {
        badController.viewDidAppear(true)
        XCTAssertFalse(badController.calledViewDidAppear, "The superclass's viewDidAppear method is not called by the bad subclass")
        XCTAssertNil(badController.viewDidAppearAnimated, "The animated flag should still be missing")
    }

    func testGoodViewWillDisappearSuperCall() {
        for controller in callingControllers {
            controller.viewWillDisappear(true)
            XCTAssertTrue(controller.calledViewWillDisappear, "The superclass's viewWillDisappear method should be called by the controller")
            XCTAssertTrue(controller.viewWillDisappearAnimated!, "The superclass's viewWillDisappear method should be passed the animated flag")

            controller.calledViewWillDisappear = false
            controller.viewWillDisappearAnimated = true
            controller.viewWillDisappear(false)
            XCTAssertTrue(controller.calledViewWillDisappear, "The superclass's viewWillDisappear method should be called by the controller")
            XCTAssertFalse(controller.viewWillDisappearAnimated!, "The superclass's viewWillDisappear method should be passed the animated flag")
        }
    }

    func testBadViewWillDisappearSuperCall() {
        badController.viewWillDisappear(true)
        XCTAssertFalse(badController.calledViewWillDisappear, "The superclass's viewWillDisappear method is not called by the bad subclass")
        XCTAssertNil(badController.viewWillDisappearAnimated, "The animated flag should still be missing")
    }

    func testGoodViewDidDisappearSuperCall() {
        for controller in callingControllers {
            controller.viewDidDisappear(true)
            XCTAssertTrue(controller.calledViewDidDisappear, "The superclass's viewDidDisappear method should be called by the controller")
            XCTAssertTrue(controller.viewDidDisappearAnimated!, "The superclass's viewDidDisappear method should be passed the animated flag")

            controller.calledViewDidDisappear = false
            controller.viewDidDisappearAnimated = true
            controller.viewDidDisappear(false)
            XCTAssertTrue(controller.calledViewDidDisappear, "The superclass's viewDidDisappear method should be called by the controller")
            XCTAssertFalse(controller.viewDidDisappearAnimated!, "The superclass's viewDidDisappear method should be passed the animated flag")
        }
    }

    func testBadViewDidDisappearSuperCall() {
        badController.viewDidDisappear(true)
        XCTAssertFalse(badController.calledViewDidDisappear, "The superclass's viewDidDisappear method is not called by the bad subclass")
        XCTAssertNil(badController.viewDidDisappearAnimated, "The animated flag should still be missing")
    }

    func testGoodDidReceiveMemoryWarningSuperCall() {
        for controller in callingControllers {
            controller.didReceiveMemoryWarning()
            XCTAssertTrue(controller.calledDidReceiveMemoryWarning, "The superclass's didReceiveMemoryWarning method should be called by the controller")
        }
    }

    func testBadDidReceiveMemoryWarningSuperCall() {
        badController.didReceiveMemoryWarning()
        XCTAssertFalse(badController.calledDidReceiveMemoryWarning, "The superclass's didReceiveMemoryWarning method is not called by the bad controller")
    }

    func testGoodUpdateViewConstraintsSuperCall() {
        for controller in callingControllers {
            controller.updateViewConstraints()
            XCTAssertTrue(controller.calledUpdateViewConstraints, "The superclass's updateViewConstraints method should be called by the controller")
        }
    }

    func testBadUpdateViewConstraintsSuperCall() {
        badController.updateViewConstraints()
        XCTAssertFalse(badController.calledUpdateViewConstraints, "The superclass's updateViewConstraints method is not called by the bad controller")
    }

    func testGoodAddChildViewControllerSuperCall() {
        for controller in callingControllers {
            controller.addChildViewController(childController)
            XCTAssertTrue(controller.calledAddChildViewController, "The superclass's addChildViewController method should be called by the controller")
            XCTAssertEqual(controller.addedChildViewController!, childController, "The child view controller being added should be passed to the superclass")
        }
    }

    func testBadAddChildViewControllerSuperCall() {
        badController.addChildViewController(childController)
        XCTAssertFalse(badController.calledAddChildViewController, "The superclass's addChildViewController method is not called by the bad controller")
        XCTAssertNil(badController.addedChildViewController, "The added child controller should still be missing")
    }

    func testGoodRemoveFromParentViewControllerSuperCall() {
        for controller in callingControllers {
            controller.removeFromParentViewController()
            XCTAssertTrue(controller.calledRemoveFromParentViewController, "The superclass's removeFromParentViewController method should be called by the controller")
        }
    }

    func testBadRemoveFromParentViewControllerSuperCall() {
        badController.removeFromParentViewController()
        XCTAssertFalse(badController.calledRemoveFromParentViewController, "The superclass's removeFromParentViewController method is not called by the bad controller")
    }

    func testGoodTransitionFromViewControllerSuperCall() {
        for parentController in callingControllers {
            let child1 = UIViewController()
            parentController.addChildViewController(child1)
            let child2 = UIViewController()
            parentController.addChildViewController(child2)
            parentController.transitionFromViewController(child1, toViewController: child2, duration: 1.23, options: animationOptions, animations: animations, completion: completion)
            XCTAssertTrue(parentController.calledTransitionFromViewController, "The superclass's transitionFromViewController method should be called by the controller")
            XCTAssertEqual(parentController.viewControllerToTransitionFrom!, child1, "The old child controller should be passed to the superclass")
            XCTAssertEqual(parentController.viewControllerToTransitionTo!, child2, "The new child controller should be passed to the superclass")
            XCTAssertEqual(parentController.transitionDuration!, 1.23, "The transition duration should be passed to the superclass")
            XCTAssertEqual(parentController.transitionAnimationOptions!, animationOptions, "The transition animation options should be passed to the superclass")
            parentController.transitionAnimations!()
            XCTAssertTrue(invokedAnimationClosure, "The transition animation closure should be passed to the superclass")
            parentController.transitionCompletion!(true)
            XCTAssertTrue(invokedCompletionClosure, "The transition completion closure should be passed to the superclass")
        }
    }

    func testBadTransitionFromViewControllerSuperCall() {
        let child1 = UIViewController()
        badController.addChildViewController(child1)
        let child2 = UIViewController()
        badController.addChildViewController(child2)
        badController.transitionFromViewController(child1, toViewController: child2, duration: 1.23, options: animationOptions, animations: animations, completion: completion)
        XCTAssertFalse(badController.calledTransitionFromViewController, "The superclass's transitionFromViewController method is not called by the bad controller")
        XCTAssertNil(badController.viewControllerToTransitionTo, "The old child controller should still be missing")
        XCTAssertNil(badController.viewControllerToTransitionFrom, "The new child controller should still be missing")
        XCTAssertNil(badController.transitionDuration, "The transition duration should still be missing")
        XCTAssertTrue(badController.transitionAnimationOptions == nil, "The transition animation options should still be missing")
        XCTAssertTrue(badController.transitionAnimations == nil, "The transition animations closure should still be missing")
        XCTAssertTrue(badController.transitionCompletion == nil, "The transition animation completion closure should still be missing")
    }

    func testGoodSetEditingSuperCall() {
        for controller in callingControllers {
            controller.setEditing(true, animated: true)
            XCTAssertTrue(controller.calledSetEditing, "The superclass's setEditing method should be called by the controller")
            XCTAssertTrue(controller.setEditingEditing!, "The superclass's setEditing method should be passed the editing flag")
            XCTAssertTrue(controller.setEditingAnimated!, "The superclass's setEditing method should be passed the animated flag")

            controller.calledSetEditing = false
            controller.setEditingEditing = true
            controller.setEditingAnimated = true
            controller.setEditing(false, animated: false)
            XCTAssertTrue(controller.calledSetEditing, "The superclass's setEditing method should be called by the controller")
            XCTAssertFalse(controller.setEditingEditing!, "The superclass's setEditing method should be passed the editing flag")
            XCTAssertFalse(controller.setEditingAnimated!, "The superclass's setEditing method should be passed the animated flag")
        }
    }

    func testBadSetEditingSuperCall() {
        badController.setEditing(true, animated: true)
        XCTAssertFalse(badController.calledSetEditing, "The superclass's setEditing method is not called by the bad controller")
        XCTAssertNil(badController.setEditingEditing, "The editing flag should still be missing")
        XCTAssertNil(badController.setEditingAnimated, "The animated flag should still be missing")
    }

    func testGoodEncodeRestorableStateWithCoderSuperCall() {
        for controller in callingControllers {
            let coder = NSKeyedArchiver(forWritingWithMutableData: NSMutableData())
            controller.encodeRestorableStateWithCoder(coder)
            coder.finishEncoding()
            XCTAssertTrue(controller.calledEncodeRestorableStateWithCoder, "The superclass's encodeRestorableStateWithCoder method should be called by the controller")
            XCTAssertEqual(controller.encodeRestorableStateCoder!, coder, "The coder should be passed to the superclass")
        }
    }

    func testBadEncodeRestorableStateWithCoderSuperCall() {
        let coder = NSKeyedArchiver(forWritingWithMutableData: NSMutableData())
        badController.encodeRestorableStateWithCoder(coder)
        coder.finishEncoding()
        XCTAssertFalse(badController.calledEncodeRestorableStateWithCoder, "The superclass's encodeRestorableStateWithCoder method is not called by the bad controller")
        XCTAssertNil(badController.encodeRestorableStateCoder, "The coder should still be missing")
    }

    func testGoodDecodeRestorableStateWithCoderSuperCall() {
        for controller in callingControllers {
            let data = NSMutableData()
            let encoder = NSKeyedArchiver(forWritingWithMutableData: data)
            controller.encodeRestorableStateWithCoder(encoder)
            encoder.finishEncoding()

            let decoder = NSKeyedUnarchiver(forReadingWithData: data)
            controller.decodeRestorableStateWithCoder(decoder)
            XCTAssertTrue(controller.calledDecodeRestorableStateWithCoder, "The superclass's decodeRestorableStateWithCoder method should be called by the controller")
            XCTAssertEqual(controller.decodeRestorableStateCoder!, decoder, "The coder should be passed to the superclass")
        }
    }

    func testBadDecodeRestorableStateWithCoderSuperCall() {
        let data = NSMutableData()
        let encoder = NSKeyedArchiver(forWritingWithMutableData: data)
        badController.encodeRestorableStateWithCoder(encoder)
        encoder.finishEncoding()

        let decoder = NSKeyedUnarchiver(forReadingWithData: data)
        badController.decodeRestorableStateWithCoder(decoder)
        XCTAssertFalse(badController.calledDecodeRestorableStateWithCoder, "The superclass's decodeRestorableStateWithCoder method is not called by the bad controller")
        XCTAssertNil(badController.decodeRestorableStateCoder, "The coder should still be missing")
    }

}
