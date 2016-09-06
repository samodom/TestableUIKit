//
//  UIToolbarCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIToolbar {

    public override func setItems(items: [UIBarButtonItem]?, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        let selector = UIToolbarTestableSelectors.SetItems
        if UIToolbar.shouldForwardMethodCallWithSelector(selector) {
            super.setItems(items, animated: animated)
        }
    }
}
