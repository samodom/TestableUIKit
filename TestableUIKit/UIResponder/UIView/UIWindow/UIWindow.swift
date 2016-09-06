//
//  UIWindow.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIWindow: UIKit.UIWindow, ShimMethodForwarding {

    /*!
        Indicates whether or not the `makeKeyWindow` method has been called on this object.
    */
    public var makeKeyWindowCalled = false

    /*!
        Indicates whether or not the `makeKeyAndVisible` method has been called on this object.
    */
    public var makeKeyAndVisibleCalled = false

    public static var shouldForwardMethodsByDefault = true

    public static var methodForwardingList = ShimMethodForwardingList()

    public enum UIWindowTestableSelectors {
        public static let MakeKeyWindow = #selector(
            UIWindow.makeKeyWindow
        )

        public static let MakeKeyWindowAndVisible = #selector(
            UIWindow.makeKeyAndVisible
        )
    }

}
