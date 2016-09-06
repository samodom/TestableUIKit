//
//  UITabBarController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UITabBarController {

    public override func setViewControllers(viewControllers: [UIKit.UIViewController]?, animated: Bool) {
        setViewControllersCalled = true
        setViewControllersViewControllers = viewControllers
        setViewControllersAnimated = animated

        let selector = UITabBarControllerTestableSelectors.SetViewControllers
        if UITabBarController.shouldForwardMethodCallWithSelector(selector) {
            super.setViewControllers(viewControllers, animated: animated)
        }
    }

}
