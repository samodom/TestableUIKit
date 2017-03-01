//
//  UIViewIndirectSpiesTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import SampleTypes
import TestSwagger
import TestableUIKit


class UIViewIndirectSpiesTests: XCTestCase {

    let plainView = PlainView()
    let compliantView = CompliantView()
    let subCompliantView = CompliantViewSubclass()
    let nonCompliantView = NonCompliantView()

    var compliantViews: [UIView]!
    var allViews: [UIView]!

//    let sampleCoder = NSCoder()

    override func setUp() {
        super.setUp()

        compliantViews = [plainView, compliantView, subCompliantView]
        allViews = [plainView, compliantView, subCompliantView, nonCompliantView]

        allViews.forEach { UIApplication.rootView.addSubview($0) }
    }

    override func tearDown() {
        allViews.forEach { $0.removeFromSuperview() }

        super.tearDown()
    }


    // MARK: - `updateConstraints`

    func testUpdateConstraintsControllerForwardingBehavior() {
        XCTAssertTrue(UIView.UpdateConstraintsSpyController.forwardsInvocations,
                      "Spies on `updateConstraints` should always forward their method invocations")
    }

    func testUpdateConstraintsSpyWithCompliantViews() {
        compliantViews.forEach { view in
            XCTAssertFalse(view.superclassUpdateConstraintsCalled,
                           "By default the view should not indicate having asked its superclass to update its constraints")

            let spy = UIView.UpdateConstraintsSpyController.createSpy(on: view)!
            spy.beginSpying()

            view.updateConstraints()
            XCTAssertTrue(view.superclassUpdateConstraintsCalled,
                          "A `UIView` subclass that calls its superclass's implementation of `updateConstraints` should indicate having called that method when being spied upon")

            if view === subCompliantView {
                XCTAssertTrue(subCompliantView.compliantViewUpdateConstraintsCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(view.superclassUpdateConstraintsCalled,
                           "The flag should be cleared after spying is complete")
        }
    }
    
    func testUpdateConstraintsSpyWithNonCompliantView() {
        let spy = UIView.UpdateConstraintsSpyController.createSpy(on: nonCompliantView)!
        spy.beginSpying()

        nonCompliantView.updateConstraints()
        XCTAssertFalse(nonCompliantView.superclassUpdateConstraintsCalled,
                       "A `UIView` subclass that does not call its superclass implementation of `updateConstraints` should not indicate having called that method when being spied upon")

        spy.endSpying()
    }


    // MARK: - `draw(_:)`

    func testDrawControllerForwardingBehavior() {
        XCTAssertTrue(UIView.DrawSpyController.forwardsInvocations,
                      "Spies on `draw(_:)` should always forward their method invocations")
    }

    func testDrawSpyWithCompliantViews() {
        compliantViews.forEach { view in
            XCTAssertFalse(view.superclassDrawCalled,
                           "By default the view should not indicate having asked its superclass to draw its contents")
            XCTAssertNil(view.superclassDrawRect,
                         "By default the view should not have a captured rect")

            let spy = UIView.DrawSpyController.createSpy(on: view)!
            spy.beginSpying()

            view.draw(SampleFrame)
            XCTAssertTrue(view.superclassDrawCalled,
                          "A `UIView` subclass that calls its superclass's implementation of `draw(_:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(view.superclassDrawRect, SampleFrame,
                           "The rect passed to the method should captured")

            if view === subCompliantView {
                XCTAssertTrue(subCompliantView.compliantViewDrawCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(view.superclassDrawCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.superclassDrawRect,
                         "The rect should be cleared after spying is complete")
        }
    }

    func testDrawSpyWithNonCompliantView() {
        let spy = UIView.DrawSpyController.createSpy(on: nonCompliantView)!
        spy.beginSpying()

        nonCompliantView.draw(SampleFrame)
        XCTAssertFalse(nonCompliantView.superclassDrawCalled,
                       "A `UIView` subclass that does not call its superclass implementation of `draw(_:)` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `encodeRestorableState(with:)`

    func testEncodeRestorableStateControllerForwardingBehavior() {
        XCTAssertTrue(UIView.EncodeRestorableStateSpyController.forwardsInvocations,
                      "Spies on `encodeRestorableState(with:)` should always forward their method invocations")
    }

    func testEncodeRestorableStateSpyWithCompliantViews() {
        compliantViews.forEach { view in
            XCTAssertFalse(view.superclassEncodeRestorableStateCalled,
                           "By default the view should not indicate having asked its superclass to encode its restorable state")
            XCTAssertNil(view.superclassEncodeRestorableStateCoder,
                         "By default the view should not have a captured coder")

            let spy = UIView.EncodeRestorableStateSpyController.createSpy(on: view)!
            spy.beginSpying()

            let coder = NSCoder()
            view.encodeRestorableState(with: coder)
            XCTAssertTrue(view.superclassEncodeRestorableStateCalled,
                          "A `UIView` subclass that calls its superclass's implementation of `encodeRestorableState(with:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(view.superclassEncodeRestorableStateCoder, coder,
                           "The coder passed to the method should captured")

            if view === subCompliantView {
                XCTAssertTrue(subCompliantView.compliantViewEncodeRestorableStateCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(view.superclassEncodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.superclassEncodeRestorableStateCoder,
                         "The rect should be cleared after spying is complete")
        }
    }

    func testEncodeRestorableStateSpyWithNonCompliantView() {
        let spy = UIView.EncodeRestorableStateSpyController.createSpy(on: nonCompliantView)!
        spy.beginSpying()

        nonCompliantView.draw(SampleFrame)
        XCTAssertFalse(nonCompliantView.superclassEncodeRestorableStateCalled,
                       "A `UIView` subclass that does not call its superclass implementation of `encodeRestorableState(with:)` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }


    // MARK: - `decodeRestorableState(with:)`

    func testDecodeRestorableStateControllerForwardingBehavior() {
        XCTAssertTrue(UIView.DecodeRestorableStateSpyController.forwardsInvocations,
                      "Spies on `decodeRestorableState(with:)` should always forward their method invocations")
    }

    func testDecodeRestorableStateSpyWithCompliantViews() {
        compliantViews.forEach { view in
            XCTAssertFalse(view.superclassDecodeRestorableStateCalled,
                           "By default the view should not indicate having asked its superclass to decode its restorable state")
            XCTAssertNil(view.superclassDecodeRestorableStateCoder,
                         "By default the view should not have a captured coder")

            let spy = UIView.DecodeRestorableStateSpyController.createSpy(on: view)!
            spy.beginSpying()

            let coder = NSCoder()
            view.decodeRestorableState(with: coder)
            XCTAssertTrue(view.superclassDecodeRestorableStateCalled,
                          "A `UIView` subclass that calls its superclass's implementation of `decodeRestorableState(with:)` should indicate having called that method when being spied upon")
            XCTAssertEqual(view.superclassDecodeRestorableStateCoder, coder,
                           "The coder passed to the method should captured")

            if view === subCompliantView {
                XCTAssertTrue(subCompliantView.compliantViewDecodeRestorableStateCalled,
                              "The spy method should always forward the method call to the original implementation")
            }

            spy.endSpying()

            XCTAssertFalse(view.superclassDecodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.superclassDecodeRestorableStateCoder,
                         "The rect should be cleared after spying is complete")
        }
    }

    func testDecodeRestorableStateSpyWithNonCompliantView() {
        let spy = UIView.DecodeRestorableStateSpyController.createSpy(on: nonCompliantView)!
        spy.beginSpying()

        nonCompliantView.draw(SampleFrame)
        XCTAssertFalse(nonCompliantView.superclassDecodeRestorableStateCalled,
                       "A `UIView` subclass that does not call its superclass implementation of `decodeRestorableState(with:)` should not indicate having called that method when being spied upon")
        
        spy.endSpying()
    }

}
