//
//  UITextField.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UITextField: UIKit.UITextField {

    /**
      Indicates whether or not the `becomeFirstResponder` method has been called on this object.
    */
    public var becomeFirstResponderCalled = false

    /**
      Indicates whether or not the `resignFirstResponder` method has been called on this object.
    */
    public var resignFirstResponderCalled = false

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
