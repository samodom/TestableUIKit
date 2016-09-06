//
//  UIResponder.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIResponder: UIKit.UIResponder, ShimMethodForwarding {

    /*!
        Indicates whether or not the `becomeFirstResponder` method has been called on this object.
    */
    public var becomeFirstResponderCalled = false

    /*!
        Indicates whether or not the `resignFirstResponder` method has been called on this object.
    */
    public var resignFirstResponderCalled = false

    public static var shouldForwardMethodsByDefault = false

    public static var methodForwardingList = ShimMethodForwardingList()

    public enum UIResponderTestableSelectors {
        public static let BecomeFirstResponder = #selector(
            UIResponder.becomeFirstResponder
        )

        public static let ResignFirstResponder = #selector(
            UIResponder.resignFirstResponder
        )
    }

}
