//
//  UIPageViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIPageViewControllerCompletionClosure = (Bool) -> ()

open class UIPageViewController: UIKit.UIPageViewController {

    /*!
        Indicates whether or not the `setViewControllers:direction:animated:completion:` method has been called on this object.
    */
    open var setViewControllersCalled = false

    /*!
        Provides the view controllers that were passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    open var setViewControllersViewControllers: [UIKit.UIViewController]?

    /*!
        Provides the navigation direction that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    open var setViewControllersDirection: UIPageViewControllerNavigationDirection?

    /*!
        Provides the animation flag that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    open var setViewControllersAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    open var setViewControllersCompletion: UIPageViewControllerCompletionClosure?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
