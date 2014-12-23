//
//  UIPageViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIPageViewControllerCompletionClosure = Bool -> ()

public class UIPageViewController: UIKit.UIPageViewController {

    /*!
        Indicates whether or not the `setViewControllers:direction:animated:completion:` method has been called on this object.
    */
    public var setViewControllersCalled = false

    /*!
        Provides the view controllers that were passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    public var setViewControllersViewControllers: [UIKit.UIViewController]?

    /*!
        Provides the navigation direction that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    public var setViewControllersDirection: UIPageViewControllerNavigationDirection?

    /*!
        Provides the animation flag that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    public var setViewControllersAnimated: Bool?

    /*!
        Provides the completion closure that was passed to the `setViewControllers:direction:animated:completion:` method, if called.
    */
    public var setViewControllersCompletion: UIPageViewControllerCompletionClosure?

    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}