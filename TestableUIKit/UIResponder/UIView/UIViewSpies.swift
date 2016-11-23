//
//  UIViewSpies.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


enum UIViewOriginalSelectors {
    static let updateConstraints = #selector(UIView.updateConstraints)
    static let draw = #selector(UIView.draw(_:))
    static let encodeRestorableState = #selector(UIView.encodeRestorableState(with:))
    static let decodeRestorableState = #selector(UIView.decodeRestorableState(with:))
    static let setNeedsLayout = #selector(UIView.setNeedsLayout)
    static let invalidateIntrinsicContentSize = #selector(UIView.invalidateIntrinsicContentSize)
    static let setNeedsUpdateConstraints = #selector(UIView.setNeedsUpdateConstraints)
    static let setNeedsDisplay = #selector(UIView.setNeedsDisplay as (UIView) -> () -> Void)
    static let setNeedsDisplayInRect = #selector(UIView.setNeedsDisplay(_:))
}

enum UIViewSpySelectors {
    static let updateConstraints = #selector(UIView.spy_updateConstraints)
    static let draw = #selector(UIView.spy_draw(_:))
    static let encodeRestorableState = #selector(UIView.spy_encodeRestorableState(with:))
    static let decodeRestorableState = #selector(UIView.spy_decodeRestorableState(with:))
    static let setNeedsLayout = #selector(UIView.spy_setNeedsLayout)
    static let invalidateIntrinsicContentSize = #selector(UIView.spy_invalidateIntrinsicContentSize)
    static let setNeedsUpdateConstraints = #selector(UIView.spy_setNeedsUpdateConstraints)
    static let setNeedsDisplay = #selector(UIView.spy_setNeedsDisplay as (UIView) -> () -> Void)
    static let setNeedsDisplayInRect = #selector(UIView.spy_setNeedsDisplay(_:))
}


public enum UIViewSpyAssociations {

    public static let updateConstraints = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.updateConstraints,
        alternateSelector: UIViewSpySelectors.updateConstraints
    )

    public static let draw = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.draw,
        alternateSelector: UIViewSpySelectors.draw
    )

    public static let encodeRestorableState = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.encodeRestorableState,
        alternateSelector: UIViewSpySelectors.encodeRestorableState
    )

    public static let decodeRestorableState = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.decodeRestorableState,
        alternateSelector: UIViewSpySelectors.decodeRestorableState
    )

    public static let setNeedsLayout = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.setNeedsLayout,
        alternateSelector: UIViewSpySelectors.setNeedsLayout
    )

    public static let invalidateIntrinsicContentSize = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.invalidateIntrinsicContentSize,
        alternateSelector: UIViewSpySelectors.invalidateIntrinsicContentSize
    )

    public static let setNeedsUpdateConstraints = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.setNeedsUpdateConstraints,
        alternateSelector: UIViewSpySelectors.setNeedsUpdateConstraints
    )

    public static let setNeedsDisplay = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.setNeedsDisplay,
        alternateSelector: UIViewSpySelectors.setNeedsDisplay
    )

    public static let setNeedsDisplayInRect = MethodAssociation(
        forClass: UIView.self,
        ofType: .instance,
        originalSelector: UIViewOriginalSelectors.setNeedsDisplayInRect,
        alternateSelector: UIViewSpySelectors.setNeedsDisplayInRect
    )

}


public extension UIView {

    //  MARK: - Spying on `updateConstraints`

    /// Spies on calls to `updateConstraints` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnUpdateConstraints(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.updateConstraints.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.updateConstraints)
    }


    /// Begins spying on calls to `updateConstraints`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnUpdateConstraints`
    public final func beginSpyingOnUpdateConstraints() {
        UIViewSpyAssociations.updateConstraints.useAlternateImplementation()
    }


    /// Ends spying on calls to `updateConstraints`
    public final func endSpyingOnUpdateConstraints() {
        UIViewSpyAssociations.updateConstraints.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.updateConstraints)
    }


    /// Spy method that replaces the true implementation of `updateConstraints`
    public func spy_updateConstraints() {
        updateConstraintsCalled = true

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.updateConstraints) else {
            return
        }

        spy_updateConstraints()
    }
    

    //  MARK: - Spying on `draw(_:)`

    /// Spies on calls to `draw(_:)` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDraw(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.draw.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.draw)
    }


    /// Begins spying on calls to `draw(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDraw`
    public final func beginSpyingOnDraw() {
        UIViewSpyAssociations.draw.useAlternateImplementation()
    }


    /// Ends spying on calls to `draw(_:)`
    public final func endSpyingOnDraw() {
        UIViewSpyAssociations.draw.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.draw)
    }


    /// Spy method that replaces the true implementation of `draw(_:)`
    public func spy_draw(_ rect: CGRect) {
        drawCalled = true
        drawRect = rect

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.draw) else {
            return
        }

        spy_draw(rect)
    }


    //  MARK: - Spying on `encodeRestorableState(with:)`

    /// Spies on calls to `encodeRestorableState(with:)` and executes the provided context 
    /// while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnEncodeRestorableState(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.encodeRestorableState.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.encodeRestorableState)
    }


    /// Begins spying on calls to `encodeRestorableState(with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnEncodeRestorableState`
    public final func beginSpyingOnEncodeRestorableState() {
        UIViewSpyAssociations.encodeRestorableState.useAlternateImplementation()
    }


    /// Ends spying on calls to `encodeRestorableState(with:)`
    public final func endSpyingOnEncodeRestorableState() {
        UIViewSpyAssociations.encodeRestorableState.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.encodeRestorableState)
    }


    /// Spy method that replaces the true implementation of `encodeRestorableState(with:)`
    public func spy_encodeRestorableState(with coder: NSCoder) {
        encodeRestorableStateCalled = true
        encodeRestorableStateCoder = coder

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.encodeRestorableState) else {
            return
        }
        
        spy_encodeRestorableState(with: coder)
    }


    //  MARK: - Spying on `decodeRestorableState(with:)`

    /// Spies on calls to `decodeRestorableState(with:)` and executes the provided context
    /// while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnDecodeRestorableState(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.decodeRestorableState.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.decodeRestorableState)
    }


    /// Begins spying on calls to `decodeRestorableState(with:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnDecodeRestorableState`
    public final func beginSpyingOnDecodeRestorableState() {
        UIViewSpyAssociations.decodeRestorableState.useAlternateImplementation()
    }


    /// Ends spying on calls to `decodeRestorableState(with:)`
    public final func endSpyingOnDecodeRestorableState() {
        UIViewSpyAssociations.decodeRestorableState.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.decodeRestorableState)
    }


    /// Spy method that replaces the true implementation of `decodeRestorableState(with:)`
    public func spy_decodeRestorableState(with coder: NSCoder) {
        decodeRestorableStateCalled = true
        decodeRestorableStateCoder = coder

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.decodeRestorableState) else {
            return
        }

        spy_decodeRestorableState(with: coder)
    }


    //  MARK: - Spying on `setNeedsLayout`

    /// Spies on calls to `setNeedsLayout` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnSetNeedsLayout(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.setNeedsLayout.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsLayout)
    }


    /// Begins spying on calls to `setNeedsLayout`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnSetNeedsLayout`
    public final func beginSpyingOnSetNeedsLayout() {
        UIViewSpyAssociations.setNeedsLayout.useAlternateImplementation()
    }


    /// Ends spying on calls to `setNeedsLayout`
    public final func endSpyingOnSetNeedsLayout() {
        UIViewSpyAssociations.setNeedsLayout.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsLayout)
    }


    /// Spy method that replaces the true implementation of `setNeedsLayout`
    public func spy_setNeedsLayout() {
        setNeedsLayoutCalled = true

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.setNeedsLayout) else {
            return
        }

        spy_setNeedsLayout()
    }


    //  MARK: - Spying on `invalidateIntrinsicContentSize`

    /// Spies on calls to `invalidateIntrinsicContentSize` and executes the provided context 
    /// while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnInvalidateIntrinsicContentSize(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.invalidateIntrinsicContentSize.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.invalidateIntrinsicContentSize)
    }


    /// Begins spying on calls to `invalidateIntrinsicContentSize`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnInvalidateIntrinsicContentSize`
    public final func beginSpyingOnInvalidateIntrinsicContentSize() {
        UIViewSpyAssociations.invalidateIntrinsicContentSize.useAlternateImplementation()
    }


    /// Ends spying on calls to `invalidateIntrinsicContentSize`
    public final func endSpyingOnInvalidateIntrinsicContentSize() {
        UIViewSpyAssociations.invalidateIntrinsicContentSize.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.invalidateIntrinsicContentSize)
    }


    /// Spy method that replaces the true implementation of `invalidateIntrinsicContentSize`
    public func spy_invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.invalidateIntrinsicContentSize) else {
            return
        }

        spy_invalidateIntrinsicContentSize()
    }


    //  MARK: - Spying on `setNeedsUpdateConstraints`

    /// Spies on calls to `setNeedsUpdateConstraints` and executes the provided context 
    /// while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnSetNeedsUpdateConstraints(in context: NullaryVoidClosure) {
        UIViewSpyAssociations.setNeedsUpdateConstraints.withAlternateImplementation(context: context)
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsUpdateConstraints)
    }


    /// Begins spying on calls to `setNeedsUpdateConstraints`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnSetNeedsUpdateConstraints`
    public final func beginSpyingOnSetNeedsUpdateConstraints() {
        UIViewSpyAssociations.setNeedsUpdateConstraints.useAlternateImplementation()
    }


    /// Ends spying on calls to `setNeedsUpdateConstraints`
    public final func endSpyingOnSetNeedsUpdateConstraints() {
        UIViewSpyAssociations.setNeedsUpdateConstraints.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsUpdateConstraints)
    }


    /// Spy method that replaces the true implementation of `setNeedsUpdateConstraints`
    public func spy_setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.setNeedsUpdateConstraints) else {
            return
        }

        spy_setNeedsUpdateConstraints()
    }


    //  MARK: - Spying on `setNeedsDisplay` and `setNeedsDisplay(_:)`

    /// Spies on calls to `setNeedsDisplay` and `setNeedsDisplay(_:)` and executes the provided context
    /// while the spy methods are active
    /// - parameter context: Logic to execute while the spy methods are active.
    public final func spyOnSetNeedsDisplay(in context: NullaryVoidClosure) {
        beginSpyingOnSetNeedsDisplay()
        context()
        endSpyingOnSetNeedsDisplay()
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsDisplay)
    }


    /// Begins spying on calls to `setNeedsDisplay` and `setNeedsDisplay(_:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnSetNeedsDisplay`
    public final func beginSpyingOnSetNeedsDisplay() {
        UIViewSpyAssociations.setNeedsDisplay.useAlternateImplementation()
        UIViewSpyAssociations.setNeedsDisplayInRect.useAlternateImplementation()
    }


    /// Ends spying on calls to `setNeedsDisplay` and `setNeedsDisplay(_:)`
    public final func endSpyingOnSetNeedsDisplay() {
        UIViewSpyAssociations.setNeedsDisplay.useOriginalImplementation()
        UIViewSpyAssociations.setNeedsDisplayInRect.useOriginalImplementation()
        clearSpyKeys(UIViewSpyCaptureKeys.setNeedsDisplay)
    }


    /// Spy method that replaces the true implementation of `setNeedsDisplay`
    public func spy_setNeedsDisplay() {
        setNeedsDisplayCalled = true

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.setNeedsDisplay) else {
            return
        }

        spy_setNeedsDisplay()
    }


    /// Spy method that replaces the true implementation of `setNeedsDisplay(_:)`
    public func spy_setNeedsDisplay(_ rect: CGRect) {
        setNeedsDisplayCalled = true
        setNeedsDisplayRect = rect

        guard forwardsMethodCalls(forSelector: UIViewOriginalSelectors.setNeedsDisplayInRect) else {
            return
        }

        spy_setNeedsDisplay(rect)
    }

}
