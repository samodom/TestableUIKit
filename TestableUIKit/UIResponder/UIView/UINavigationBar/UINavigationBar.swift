//
//  UINavigationBar.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class UINavigationBar: UIKit.UINavigationBar {

    /*!
        Indicates whether or not the `pushNavigationItem:animated:` method has been called on this object.
    */
    open var pushNavigationItemCalled = false

    /*!
        Provides the item passed to the `pushNavigationItem:animated:` method, if called.
    */
    open var pushNavigationItemNavigationItem: UINavigationItem?

    /*!
        Provides the animation flag passed to the `pushNavigationItem:animated:` method, if called.
    */
    open var pushNavigationItemAnimated: Bool?

    /*!
        Indicates whether or not the `popNavigationItemAnimated:` method has been called on this object.
    */
    open var popNavigationItemCalled = false

    /*!
        Provides the item passed to the `popNavigationItemAnimated:` method, if called.
    */
    open var popNavigationItemAnimated: Bool?

    /*!
        Indicates whether or not the `setItems:animated:` method has been called on this object.
    */
    open var setItemsCalled = false

    /*!
        Provides the item passed to the `setItems:animated:` method, if called.
    */
    open var setItemsItems: [UINavigationItem]?

    /*!
        Provides the animation flag passed to the `setItems:animated:` method, if called.
    */
    open var setItemsAnimated: Bool?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
