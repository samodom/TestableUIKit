//
//  UINavigationBar.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UINavigationBar: UIKit.UINavigationBar, ShimMethodForwarding {

    /*!
        Indicates whether or not the `pushNavigationItem:animated:` method has been called on this object.
    */
    public var pushNavigationItemCalled = false

    /*!
        Provides the item passed to the `pushNavigationItem:animated:` method, if called.
    */
    public var pushNavigationItemNavigationItem: UINavigationItem?

    /*!
        Provides the animation flag passed to the `pushNavigationItem:animated:` method, if called.
    */
    public var pushNavigationItemAnimated: Bool?

    /*!
        Indicates whether or not the `popNavigationItemAnimated:` method has been called on this object.
    */
    public var popNavigationItemCalled = false

    /*!
        Provides the item passed to the `popNavigationItemAnimated:` method, if called.
    */
    public var popNavigationItemAnimated: Bool?

    /*!
        Indicates whether or not the `setItems:animated:` method has been called on this object.
    */
    public var setItemsCalled = false

    /*!
        Provides the item passed to the `setItems:animated:` method, if called.
    */
    public var setItemsItems: [UINavigationItem]?

    /*!
        Provides the animation flag passed to the `setItems:animated:` method, if called.
    */
    public var setItemsAnimated: Bool?


    public static var methodForwardingList = ShimMethodForwardingList()

    public static var shouldForwardMethodsByDefault = true

    public enum UINavigationBarTestableSelectors {
        public static let PushNavigationItem = #selector(
            UINavigationBar.pushNavigationItem(_:animated:)
        )

        public static let PopNavigationItem = #selector(
            UINavigationBar.popNavigationItemAnimated(_:)
        )

        public static let SetItems = #selector(
            UINavigationBar.setItems(_:animated:)
        )
    }

}
