//
//  UIToolbarEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


enum UIToolbarSpyCaptureKeys {

    /// `setItems(_:animated:)`

    static let setItems = [setItemsCalled, setItemsItems, setItemsAnimated]
    private static let setItemsCalledString = UUIDKeyString()
    private static let setItemsItemsString = UUIDKeyString()
    private static let setItemsAnimatedString = UUIDKeyString()
    static let setItemsCalled = ObjectAssociationKey(setItemsCalledString)
    static let setItemsItems = ObjectAssociationKey(setItemsItemsString)
    static let setItemsAnimated = ObjectAssociationKey(setItemsAnimatedString)

}


public extension UIToolbar {

    /// Indicates whether the `setItems(_:animated:)` method has been called on this object.
    public final var setItemsCalled: Bool {
        get {
            return booleanAssociation(
                for: UIToolbarSpyCaptureKeys.setItemsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIToolbarSpyCaptureKeys.setItemsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }

    /// Provides the item passed to the `setItems(_:animated:)` method, if called.
    public final var setItemsItems: [UIBarButtonItem]? {
        get {
            return association(for: UIToolbarSpyCaptureKeys.setItemsItems) as? [UIBarButtonItem]
        }
        set {
            let key = UIToolbarSpyCaptureKeys.setItemsItems
            guard let items = newValue else {
                return removeAssociation(for: key)
            }

            associate(items, with: key)
        }
    }


    /// Provides the animation flag passed to the `setItems(_:animated:)` method, if called.
    public final var setItemsAnimated: Bool? {
        get {
            return booleanAssociation(for: UIToolbarSpyCaptureKeys.setItemsAnimated)
        }
        set {
            let key = UIToolbarSpyCaptureKeys.setItemsAnimated
            guard let animated = newValue, animated else {
                return removeAssociation(for: key)
            }

            associate(animated, with: key)
        }
    }

}
