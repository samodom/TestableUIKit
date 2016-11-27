//
//  UIViewSpyTests.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest
import TestableUIKit
import SampleTypes

class UIViewSpyTests: SpyTestCase {

    let goodView = GoodView()
    let subView = GoodViewSubclass()
    let badView = BadView()
    let plainView = UIView()
    let emptyView = EmptyView()

    var capturedViews: [UIView]!
    var callingViews = [UIView]()

    let sampleFrame = CGRect(x: 1, y: 2, width: 3, height: 4)
    let sampleCoder = NSCoder()

    override func setUp() {
        super.setUp()

        capturedViews = [goodView, subView, plainView, emptyView]
        callingViews += [goodView, plainView, emptyView, subView]
    }


    func testDefaultMethodCallForwarding() {
        XCTAssertTrue(plainView.forwardsMethodCallsByDefault,
                      "By default this spy should forward method calls")

        UIViewSpyAssociations.allOriginalSelectors.forEach { selector in
            XCTAssertTrue(plainView.forwardsMethodCalls(for: selector),
                          "By default `UIView` should forward spied calls to `\(selector)`")
        }
    }


    //  MARK: - `updateConstraints`

    func testGoodUpdateConstraintsSuperCallWithContext() {
        association = UIViewSpyAssociations.updateConstraints
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.updateConstraintsCalled,
                           "By default the view should not indicate having been asked to update its constraints")

            view.spyOnUpdateConstraints() {
                contextExecuted = true
                validateMethodsAreSwizzled()

                view.updateConstraints()
                XCTAssertTrue(view.updateConstraintsCalled,
                              "The superclass's `updateConstraints` method should be called by the view")
            }

            XCTAssertTrue(contextExecuted, "The context should be executed")
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.updateConstraintsCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testBadUpdateConstraintsSuperCallWithContext() {
        badView.spyOnUpdateConstraints {
            badView.updateConstraints()
            XCTAssertFalse(badView.updateConstraintsCalled,
                           "The superclass's `updateConstraints` method is not called by the bad view")
        }
    }

    func testGoodUpdateConstraintsSuperCallWithoutContext() {
        association = UIViewSpyAssociations.updateConstraints
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.updateConstraintsCalled,
                           "By default the view should not indicate having been asked to update its constraints")

            view.beginSpyingOnUpdateConstraints()
            validateMethodsAreSwizzled()

            view.updateConstraints()
            XCTAssertTrue(view.updateConstraintsCalled,
                          "The superclass's `updateConstraints` method should be called by the view")


            view.endSpyingOnUpdateConstraints()
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.updateConstraintsCalled,
                           "The flag should be cleared after spying is complete")
        }
    }

    func testBadUpdateConstraintsSuperCallWithoutContext() {
        badView.beginSpyingOnUpdateConstraints()
        badView.updateConstraints()
        XCTAssertFalse(badView.updateConstraintsCalled,
                       "The superclass's `updateConstraints` method is not called by the bad view")
        badView.endSpyingOnUpdateConstraints()
    }


    //  MARK: - `draw(_:)`

    func testGoodDrawSuperCallWithContext() {
        association = UIViewSpyAssociations.draw
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.drawCalled,
                           "By default the view should not indicate having been asked to draw its contents")
            XCTAssertNil(view.drawRect, "By default there should be no captured rect")

            view.spyOnDraw {
                contextExecuted = true
                validateMethodsAreSwizzled()

                view.draw(sampleFrame)
                XCTAssertTrue(view.drawCalled,
                              "The superclass's `draw(_:)` method should be called by the view")
                XCTAssertEqual(view.drawRect, sampleFrame,
                              "The superclass's `draw(_:)` method should be called with the same rect")
            }

            XCTAssertTrue(contextExecuted, "The context should be executed")
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.drawCalled, "The flag should be cleared after spying is complete")
            XCTAssertNil(view.drawRect, "The captured rect should be cleared after spying is complete")
        }
    }

    func testBadDrawSuperCallWithContext() {
        badView.spyOnDraw {
            badView.draw(sampleFrame)
            XCTAssertFalse(badView.drawCalled,
                           "The superclass's `draw(_:)` method is not called by the bad view")
        }
    }

    func testGoodDrawSuperCallWithoutContext() {
        association = UIViewSpyAssociations.draw
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.drawCalled,
                           "By default the view should not indicate having been asked to draw its contents")
            XCTAssertNil(view.drawRect, "By default there should be no captured rect")

            view.beginSpyingOnDraw()
            validateMethodsAreSwizzled()

            view.draw(sampleFrame)
            XCTAssertTrue(view.drawCalled,
                          "The superclass's `draw(_:)` method should be called by the view")
            XCTAssertEqual(view.drawRect, sampleFrame,
                           "The superclass's `draw(_:)` method should be called with the same rect")


            view.endSpyingOnDraw()
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.drawCalled, "The flag should be cleared after spying is complete")
            XCTAssertNil(view.drawRect, "The captured rect should be cleared after spying is complete")
        }
    }
    
    func testBadDrawSuperCallWithoutContext() {
        badView.beginSpyingOnDraw()
        badView.draw(sampleFrame)
        XCTAssertFalse(badView.drawCalled,
                       "The superclass's `draw(_:)` method is not called by the bad view")
        badView.endSpyingOnDraw()
    }


    //  MARK: - `encodeRestorableState(with:)`

    func testEncodeRestorableStateSuperCallWithContext() {
        association = UIViewSpyAssociations.encodeRestorableState
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.encodeRestorableStateCalled,
                           "By default the view should not indicate having been asked to encode its restorable state")
            XCTAssertNil(view.encodeRestorableStateCoder, "By default there should be no captured coder")

            view.spyOnEncodeRestorableState {
                contextExecuted = true
                validateMethodsAreSwizzled()

                view.encodeRestorableState(with: sampleCoder)
                XCTAssertTrue(view.encodeRestorableStateCalled,
                              "The superclass's `encodeRestorableState(with:)` method should be called by the view")
                XCTAssertEqual(view.encodeRestorableStateCoder, sampleCoder,
                              "The superclass's `encodeRestorableState(with:)` method should be called with the same coder")
            }

            XCTAssertTrue(contextExecuted, "The context should be executed")
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.encodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.encodeRestorableStateCoder,
                         "The captured coder should be cleared after spying is complete")
        }
    }

    func testBadEncodeRestorableStateSuperCallWithContext() {
        badView.spyOnEncodeRestorableState {
            badView.encodeRestorableState(with: sampleCoder)
            XCTAssertFalse(badView.encodeRestorableStateCalled, "The superclass's `encodeRestorableState(with:)` method is not called by the bad view")
        }
    }

    func testEncodeRestorableStateSuperCallWithoutContext() {
        association = UIViewSpyAssociations.encodeRestorableState
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.encodeRestorableStateCalled,
                           "By default the view should not indicate having been asked to encode its restorable state")
            XCTAssertNil(view.encodeRestorableStateCoder, "By default there should be no captured coder")

            view.beginSpyingOnEncodeRestorableState()
            validateMethodsAreSwizzled()

            view.encodeRestorableState(with: sampleCoder)
            XCTAssertTrue(view.encodeRestorableStateCalled,
                          "The superclass's `encodeRestorableState(with:)` method should be called by the view")
            XCTAssertEqual(view.encodeRestorableStateCoder, sampleCoder,
                           "The superclass's `encodeRestorableState(with:)` method should be called with the same coder")

            view.endSpyingOnEncodeRestorableState()
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.encodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.encodeRestorableStateCoder,
                         "The captured coder should be cleared after spying is complete")
        }
    }

    func testBadEncodeRestorableStateSuperCallWithoutContext() {
        badView.beginSpyingOnEncodeRestorableState()
        badView.encodeRestorableState(with: sampleCoder)
        XCTAssertFalse(badView.encodeRestorableStateCalled,
                       "The superclass's `encodeRestorableState(with:)` method is not called by the bad view")
        badView.endSpyingOnEncodeRestorableState()
    }


    //  MARK: - `decodeRestorableState(with:)`

    func testDecodeRestorableStateSuperCallWithContext() {
        association = UIViewSpyAssociations.decodeRestorableState
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.decodeRestorableStateCalled,
                           "By default the view should not indicate having been asked to decode its restorable state")
            XCTAssertNil(view.decodeRestorableStateCoder, "By default there should be no captured coder")

            view.spyOnDecodeRestorableState {
                contextExecuted = true
                validateMethodsAreSwizzled()

                view.decodeRestorableState(with: sampleCoder)
                XCTAssertTrue(view.decodeRestorableStateCalled,
                              "The superclass's `decodeRestorableState(with:)` method should be called by the view")
                XCTAssertEqual(view.decodeRestorableStateCoder, sampleCoder,
                               "The superclass's `decodeRestorableState(with:)` method should be called with the same coder")
            }

            XCTAssertTrue(contextExecuted, "The context should be executed")
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.decodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.decodeRestorableStateCoder,
                         "The captured coder should be cleared after spying is complete")
        }
    }

    func testBadDecodeRestorableStateSuperCallWithContext() {
        badView.spyOnDecodeRestorableState {
            badView.decodeRestorableState(with: sampleCoder)
            XCTAssertFalse(badView.decodeRestorableStateCalled,
                           "The superclass's `decodeRestorableState(with:)` method is not called by the bad view")
        }
    }

    func testDecodeRestorableStateSuperCallWithoutContext() {
        association = UIViewSpyAssociations.decodeRestorableState
        inspectImplementations()

        callingViews.forEach { view in
            XCTAssertFalse(view.decodeRestorableStateCalled,
                           "By default the view should not indicate having been asked to decode its restorable state")
            XCTAssertNil(view.decodeRestorableStateCoder, "By default there should be no captured coder")

            view.beginSpyingOnDecodeRestorableState()
            validateMethodsAreSwizzled()

            view.decodeRestorableState(with: sampleCoder)
            XCTAssertTrue(view.decodeRestorableStateCalled,
                          "The superclass's `decodeRestorableState(with:)` method should be called by the view")
            XCTAssertEqual(view.decodeRestorableStateCoder, sampleCoder,
                           "The superclass's `decodeRestorableState(with:)` method should be called with the same coder")

            view.endSpyingOnDecodeRestorableState()
            validateMethodsAreNotSwizzled()
            XCTAssertFalse(view.decodeRestorableStateCalled,
                           "The flag should be cleared after spying is complete")
            XCTAssertNil(view.decodeRestorableStateCoder,
                         "The captured coder should be cleared after spying is complete")
        }
    }

    func testBadDecodeRestorableStateSuperCallWithoutContext() {
        badView.beginSpyingOnDecodeRestorableState()
        badView.decodeRestorableState(with: sampleCoder)
        XCTAssertFalse(badView.decodeRestorableStateCalled,
                       "The superclass's `decodeRestorableState(with:)` method is not called by the bad view")
        badView.endSpyingOnDecodeRestorableState()
    }


    //  MARK: - `setNeedsLayout`

    func testSetNeedsLayoutCallWithContext() {
        association = UIViewSpyAssociations.setNeedsLayout
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsLayoutCalled,
                       "By default the view should not indicate having been told that it needs layout")

        plainView.spyOnSetNeedsLayout() {
            contextExecuted = true
            validateMethodsAreSwizzled()

            plainView.setNeedsLayout()
            XCTAssertTrue(plainView.setNeedsLayoutCalled,
                          "The view should indicate having been told that it needs layout")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsLayoutCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testSetNeedsLayoutCallWithoutContext() {
        association = UIViewSpyAssociations.setNeedsLayout
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsLayoutCalled,
                       "By default the view should not indicate having been told that it needs layout")

        plainView.beginSpyingOnSetNeedsLayout()
        validateMethodsAreSwizzled()

        plainView.setNeedsLayout()
        XCTAssertTrue(plainView.setNeedsLayoutCalled,
                      "The view should indicate having been told that it needs layout")

        plainView.endSpyingOnSetNeedsLayout()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsLayoutCalled,
                       "The flag should be cleared after spying is complete")
    }
    

    //  MARK: - `invalidateIntrinsicContentSize`

    func testInvalidateIntrinsicContentSizeCallWithContext() {
        association = UIViewSpyAssociations.invalidateIntrinsicContentSize
        inspectImplementations()

        XCTAssertFalse(plainView.invalidateIntrinsicContentSizeCalled,
                       "By default the view should not indicate having been asked to invalidate its intrinsic content size")

        plainView.spyOnInvalidateIntrinsicContentSize() {
            contextExecuted = true
            validateMethodsAreSwizzled()

            plainView.invalidateIntrinsicContentSize()
            XCTAssertTrue(plainView.invalidateIntrinsicContentSizeCalled,
                          "The view should indicate having been asked to invalidate its intrinsic content size")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.invalidateIntrinsicContentSizeCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testInvalidateIntrinsicContentSizeCallWithoutContext() {
        association = UIViewSpyAssociations.invalidateIntrinsicContentSize
        inspectImplementations()

        XCTAssertFalse(plainView.invalidateIntrinsicContentSizeCalled,
                       "By default the view should not indicate having been asked to invalidate its intrinsic content size")

        plainView.beginSpyingOnInvalidateIntrinsicContentSize()
        validateMethodsAreSwizzled()

        plainView.invalidateIntrinsicContentSize()
        XCTAssertTrue(plainView.invalidateIntrinsicContentSizeCalled,
                      "The view should indicate having been asked to invalidate its intrinsic content size")

        plainView.endSpyingOnInvalidateIntrinsicContentSize()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.invalidateIntrinsicContentSizeCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `setNeedsUpdateConstraints`

    func testSetNeedsUpdateConstraintsCallWithContext() {
        association = UIViewSpyAssociations.setNeedsUpdateConstraints
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsUpdateConstraintsCalled,
                       "By default the view should not indicate having been told that it needs to update its constraints")

        plainView.spyOnSetNeedsUpdateConstraints() {
            contextExecuted = true
            validateMethodsAreSwizzled()

            plainView.setNeedsUpdateConstraints()
            XCTAssertTrue(plainView.setNeedsUpdateConstraintsCalled,
                          "The view should indicate having been told that it needs to update its constraints")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsUpdateConstraintsCalled,
                       "The flag should be cleared after spying is complete")
    }

    func testSetNeedsUpdateConstraintsCallWithoutContext() {
        association = UIViewSpyAssociations.setNeedsUpdateConstraints
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsUpdateConstraintsCalled,
                       "By default the view should not indicate having been told that it needs to update its constraints")

        plainView.beginSpyingOnSetNeedsUpdateConstraints()
        validateMethodsAreSwizzled()

        plainView.setNeedsUpdateConstraints()
        XCTAssertTrue(plainView.setNeedsUpdateConstraintsCalled,
                      "The view should indicate having been told that it needs to update its constraints")

        plainView.endSpyingOnSetNeedsUpdateConstraints()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsUpdateConstraintsCalled,
                       "The flag should be cleared after spying is complete")
    }


    //  MARK: - `setNeedsDisplay` and `setNeedsDisplay(_:)`

    func testSetNeedsDisplayCallWithContext() {
        association = UIViewSpyAssociations.setNeedsDisplay
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs to be displayed")

        plainView.spyOnSetNeedsDisplay {
            contextExecuted = true
            validateMethodsAreSwizzled()

            plainView.setNeedsDisplay()
            XCTAssertTrue(plainView.setNeedsDisplayCalled,
                          "The view should indicate having been told that it needs to be displayed")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsDisplayCalled, "The flag should be cleared after spying is complete")
    }

    func testSetNeedsDisplayCallWithoutContext() {
        association = UIViewSpyAssociations.setNeedsDisplay
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs to be displayed")

        plainView.beginSpyingOnSetNeedsDisplay()
        validateMethodsAreSwizzled()

        plainView.setNeedsDisplay()
        XCTAssertTrue(plainView.setNeedsDisplayCalled,
                      "The view should indicate having been told that it needs to be displayed")

        plainView.endSpyingOnSetNeedsDisplay()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsDisplayCalled, "The flag should be cleared after spying is complete")
    }

    func testSetNeedsDisplayInRectCallWithContext() {
        association = UIViewSpyAssociations.setNeedsDisplayInRect
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs to be displayed")
        XCTAssertNil(plainView.setNeedsDisplayRect, "By default there should be no captured rect")

        plainView.spyOnSetNeedsDisplay {
            contextExecuted = true
            validateMethodsAreSwizzled()

            plainView.setNeedsDisplay(sampleFrame)
            XCTAssertTrue(plainView.setNeedsDisplayCalled,
                          "The view should indicate having been told that it needs to be displayed")
            XCTAssertEqual(plainView.setNeedsDisplayRect, sampleFrame,
                          "The view should capture the rect passed to the method")
        }

        XCTAssertTrue(contextExecuted, "The context should be executed")
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsDisplayCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(plainView.setNeedsDisplayRect, "The captured rect should be cleared after spying is complete")
    }

    func testSetNeedsDisplayInRectCallWithoutContext() {
        association = UIViewSpyAssociations.setNeedsDisplayInRect
        inspectImplementations()

        XCTAssertFalse(plainView.setNeedsDisplayCalled,
                       "By default the view should not indicate having been told that it needs to be displayed")
        XCTAssertNil(plainView.setNeedsDisplayRect, "By default there should be no captured rect")

        plainView.beginSpyingOnSetNeedsDisplay()
        validateMethodsAreSwizzled()

        plainView.setNeedsDisplay(sampleFrame)
        XCTAssertTrue(plainView.setNeedsDisplayCalled,
                      "The view should indicate having been told that it needs to be displayed")
        XCTAssertEqual(plainView.setNeedsDisplayRect, sampleFrame,
                       "The view should capture the rect passed to the method")

        plainView.endSpyingOnSetNeedsDisplay()
        validateMethodsAreNotSwizzled()
        XCTAssertFalse(plainView.setNeedsDisplayCalled, "The flag should be cleared after spying is complete")
        XCTAssertNil(plainView.setNeedsDisplayRect, "The captured rect should be cleared after spying is complete")
    }
    
}


fileprivate extension UIViewSpyAssociations {

    static var allOriginalSelectors: [Selector] {
        return [
            UIViewSpyAssociations.updateConstraints.originalSelector,
            UIViewSpyAssociations.draw.originalSelector,
            UIViewSpyAssociations.encodeRestorableState.originalSelector,
            UIViewSpyAssociations.decodeRestorableState.originalSelector,
            UIViewSpyAssociations.setNeedsLayout.originalSelector,
            UIViewSpyAssociations.invalidateIntrinsicContentSize.originalSelector,
            UIViewSpyAssociations.setNeedsUpdateConstraints.originalSelector,
            UIViewSpyAssociations.setNeedsDisplay.originalSelector,
            UIViewSpyAssociations.setNeedsDisplayInRect.originalSelector
        ]
    }

}
