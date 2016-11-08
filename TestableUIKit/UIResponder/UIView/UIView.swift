//
//  UIView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class UIView: UIKit.UIView {

    //  MARK: Superclass calls

    /*!
        Indicates whether or not this class called the superclass implementation of `updateConstraints`.
    */
    open var calledUpdateConstraints = false

    /*!
        Indicates whether or not this class called the superclass implementation of `drawRect:`.
    */
    open var calledDrawRect = false

    /*!
        Provides the rect that was passed to the superclass implementation of `drawRect:`, if called.
    */
    open var drawRectRect: CGRect?

    /*!
        Indicates whether or not this class called the superclass implementation of `encodeRestorableStateWithCoder:`.
    */
    open var calledEncodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder:`, if called.
    */
    open var encodeRestorableStateCoder: NSCoder?

    /*!
        Indicates whether or not this class called the superclass implementation of `decodeRestorableStateWithCoder:`.
    */
    open var calledDecodeRestorableStateWithCoder = false

    /*!
        Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder:`, if called.
    */
    open var decodeRestorableStateCoder: NSCoder?


    //  MARK: Class spies

    /*!
        Indicates whether or not the `setNeedsLayout` method has been called on this object.
    */
    open var setNeedsLayoutCalled = false

    /*!
        Indicates whether or not the `invalidateIntrinsicContentSize` method has been called on this object.
    */
    open var invalidateIntrinsicContentSizeCalled = false

    /*!
        Indicates whether or not the `setNeedsUpdateConstraints` method has been called on this object.
    */
    open var setNeedsUpdateConstraintsCalled = false

    /*!
        Indicates whether or not the `setNeedsDisplay` method has been called on this object.
    */
    open var setNeedsDisplayCalled = false

    /*!
        Indicates whether or not the `setNeedsDisplayInRect:` method has been called on this object.
    */
    open var setNeedsDisplayInRectCalled = false

    /*!
        Provides the rect passed to the `setNeedsDisplayInRect:` method, if called.
    */
    open var setNeedsDisplayInRectRect: CGRect?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
