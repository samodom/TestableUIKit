//
//  UIView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIView: UIKit.UIView {

    //  MARK: Superclass calls

    /**
      Indicates whether or not this class called the superclass implementation of `updateConstraints`.
    */
    public var calledUpdateConstraints = false

    /**
      Indicates whether or not this class called the superclass implementation of `drawRect`.
    */
    public var calledDrawRect = false

    /**
      Provides the rect that was passed to the superclass implementation of `drawRect`, if called.
    */
    public var drawRectRect: CGRect?

    /**
      Indicates whether or not this class called the superclass implementation of `encodeRestorableStateWithCoder`.
    */
    public var calledEncodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `encodeRestorableStateWithCoder`, if called.
    */
    public var encodeRestorableStateCoder: NSCoder?

    /**
      Indicates whether or not this class called the superclass implementation of `decodeRestorableStateWithCoder`.
    */
    public var calledDecodeRestorableStateWithCoder = false

    /**
      Provides the coder that was passed to the superclass implementation of `decodeRestorableStateWithCoder`, if called.
    */
    public var decodeRestorableStateCoder: NSCoder?


    //  MARK: Class spies

    /**
      Indicates whether or not the `setNeedsLayout` method has been called on this object.
    */
    public var setNeedsLayoutCalled = false

    /**
      Indicates whether or not the `invalidateIntrinsicContentSize` method has been called on this object.
    */
    public var invalidateIntrinsicContentSizeCalled = false

    /**
      Indicates whether or not the `setNeedsUpdateConstraints` method has been called on this object.
    */
    public var setNeedsUpdateConstraintsCalled = false

    /**
      Indicates whether or not the `setNeedsDisplay` method has been called on this object.
    */
    public var setNeedsDisplayCalled = false

    /**
      Indicates whether or not the `setNeedsDisplayInRect` method has been called on this object.
    */
    public var setNeedsDisplayInRectCalled = false

    /**
      Provides the rect passed to the `setNeedsDisplayInRect` method, if called.
    */
    public var setNeedsDisplayInRectRect: CGRect?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
