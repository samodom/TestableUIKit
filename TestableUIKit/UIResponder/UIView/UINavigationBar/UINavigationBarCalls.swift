//
//  UINavigationBarCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UINavigationBar {

    public override func pushNavigationItem(item: UINavigationItem, animated: Bool) {
        pushNavigationItemCalled = true
        pushNavigationItemNavigationItem = item
        pushNavigationItemAnimated = animated

        let selector = UINavigationBarTestableSelectors.PushNavigationItem
        if UINavigationBar.shouldForwardMethodCallWithSelector(selector) {
            super.pushNavigationItem(item, animated: animated)
        }
    }

    public override func popNavigationItemAnimated(animated: Bool) -> UINavigationItem? {
        popNavigationItemCalled = true
        popNavigationItemAnimated = animated

        let selector = UINavigationBarTestableSelectors.PopNavigationItem
        return UINavigationBar.shouldForwardMethodCallWithSelector(selector) ?
            super.popNavigationItemAnimated(animated) : nil
    }

    public override func setItems(items: [UINavigationItem]!, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        let selector = UINavigationBarTestableSelectors.SetItems
        if UINavigationBar.shouldForwardMethodCallWithSelector(selector) {
            super.setItems(items, animated: animated)
        }
    }
}
