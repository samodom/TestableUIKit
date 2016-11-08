//
//  UIToolbar.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class UIToolbar: UIKit.UIToolbar {

    /*!
        Indicates whether or not the `setItems:animated:` method has been called on this object.
    */
    open var setItemsCalled = false

    /*!
        Provides the item passed to the `setItems:animated:` method, if called.
    */
    open var setItemsItems: [UIBarItem]?

    /*!
        Provides the animation flag passed to the `setItems:animated:` method, if called.
    */
    open var setItemsAnimated: Bool?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
