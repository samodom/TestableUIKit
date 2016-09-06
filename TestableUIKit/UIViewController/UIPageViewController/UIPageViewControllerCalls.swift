//
//  UIPageViewController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIPageViewController {

    public override func setViewControllers(viewControllers: [UIKit.UIViewController]?, direction: UIPageViewControllerNavigationDirection, animated: Bool, completion: ((Bool) -> Void)!) {
        setViewControllersCalled = true
        setViewControllersViewControllers = viewControllers
        setViewControllersDirection = direction
        setViewControllersAnimated = animated
        setViewControllersCompletion = completion

        let selector = UIPageViewControllerTestableSelectors.SetViewControllers
        if UIPageViewController.shouldForwardMethodCallWithSelector(selector) {
            super.setViewControllers(viewControllers, direction: direction, animated: animated, completion: completion)
        }
    }

}
