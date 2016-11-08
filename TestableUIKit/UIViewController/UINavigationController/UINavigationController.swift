//
//  UINavigationController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class UINavigationController: UIKit.UINavigationController {

    /*!
        Indicates whether or not the `pushViewController:animated:` method has been called on this object.
    */
    open var pushViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `pushViewController:animated:` method, if called.
    */
    open var pushViewControllerViewController: UIKit.UIViewController?

    /*!
        Provides the animation flag that was passed to the `pushViewController:animated:` method, if called.
    */
    open var pushViewControllerAnimated: Bool?

    /*!
        Indicates whether or not the `popViewControllerAnimated:` method has been called on this object.
    */
    open var popViewControllerCalled = false

    /*!
        Provides the animation flag that was passed to the `popViewControllerAnimated:` method, if called.
    */
    open var popViewControllerAnimated: Bool?

    /*!
        Indicates whether or not the `popToRootViewControllerAnimated:` method has been called on this object.
    */
    open var popToRootViewControllerCalled = false

    /*!
        Provides the animation flag that was passed to the `popToRootViewControllerAnimated:` method, if called.
    */
    open var popToRootViewControllerAnimated: Bool?

    /*!
        Indicates whether or not the `popToViewController:animated:` method has been called on this object.
    */
    open var popToViewControllerCalled = false

    /*!
        Provides the view controller that was passed to the `popToViewController:animated:` method, if called.
    */
    open var popToViewControllerViewController: UIKit.UIViewController?

    /*!
        Provides the animation flag that was passed to the `popToViewController:animated:` method, if called.
    */
    open var popToViewControllerAnimated: Bool?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
