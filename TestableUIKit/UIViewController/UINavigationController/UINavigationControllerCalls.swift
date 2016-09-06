//
//  UINavigationController.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UINavigationController {

    public override func pushViewController(viewController: UIKit.UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        pushViewControllerViewController = viewController
        pushViewControllerAnimated = animated

        let selector = UINavigationControllerTestableSelectors.PushViewController
        if UINavigationController.shouldForwardMethodCallWithSelector(selector) {
            super.pushViewController(viewController, animated: animated)
        }
    }

    public override func popViewControllerAnimated(animated: Bool) -> UIKit.UIViewController? {
        popViewControllerCalled = true
        popViewControllerAnimated = animated

        let selector = UINavigationControllerTestableSelectors.PopViewController
        return UINavigationController.shouldForwardMethodCallWithSelector(selector) ?
            super.popViewControllerAnimated(animated) : nil
    }

    public override func popToRootViewControllerAnimated(animated: Bool) -> [UIKit.UIViewController]? {
        popToRootViewControllerCalled = true
        popToRootViewControllerAnimated = animated

        let selector = UINavigationControllerTestableSelectors.PopToRootViewController
        return UINavigationController.shouldForwardMethodCallWithSelector(selector) ?
            super.popToRootViewControllerAnimated(animated): nil
    }

    public override func popToViewController(viewController: UIKit.UIViewController, animated: Bool) -> [UIKit.UIViewController]? {
        popToViewControllerCalled = true
        popToViewControllerAnimated = animated
        popToViewControllerViewController = viewController

        let selector = UINavigationControllerTestableSelectors.PopToViewController
        return UINavigationController.shouldForwardMethodCallWithSelector(selector) ?
            super.popToViewController(viewController, animated: animated) : nil
    }
    
}
