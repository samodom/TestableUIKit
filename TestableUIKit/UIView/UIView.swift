//
//  UIView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIView: UIKit.UIView {

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

}
