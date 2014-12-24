//
//  UIWindow.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIWindow: UIKit.UIWindow {

    /*!
        Indicates whether or not the `makeKeyWindow` method has been called on this object.
    */
    public var makeKeyWindowCalled = false

    /*!
        Indicates whether or not the `makeKeyAndVisible` method has been called on this object.
    */
    public var makeKeyAndVisibleCalled = false

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}