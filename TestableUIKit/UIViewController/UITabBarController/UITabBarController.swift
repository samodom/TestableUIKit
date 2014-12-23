//
//  UITabBarController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UITabBarController: UIKit.UITabBarController {

    /*!
        Indicates whether or not the `setViewControllers:animated:` method has been called on this object.
    */
    public var setViewControllersCalled = false

    /*!
        Provides the view controllers that were passed to the `setViewControllers:animated:` method, if called.
    */
    public var setViewControllersViewControllers: [UIKit.UIViewController]?

    /*!
        Provides the animation flag that was passed to the `setViewControllers:animated:` method, if called.
    */
    public var setViewControllersAnimated: Bool?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}