//
//  UINavigationBarEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


enum UINavigationBarSpyCaptureKeys {


    /// `pushItem(_:animated:)`

    static let pushItem = [pushItemCalled, pushItemItem, pushItemAnimated]
    private static let pushItemCalledString = UUIDKeyString()
    private static let pushItemItemString = UUIDKeyString()
    private static let pushItemAnimatedString = UUIDKeyString()
    static let pushItemCalled = ObjectAssociationKey(pushItemCalledString)
    static let pushItemItem = ObjectAssociationKey(pushItemItemString)
    static let pushItemAnimated = ObjectAssociationKey(pushItemAnimatedString)


    /// `popItem(animated:)`

    static let popItem = [popItemCalled, popItemAnimated]
    private static let popItemCalledString = UUIDKeyString()
    private static let popItemAnimatedString = UUIDKeyString()
    static let popItemCalled = ObjectAssociationKey(popItemCalledString)
    static let popItemAnimated = ObjectAssociationKey(popItemAnimatedString)


    /// `setItems(_:animated:)`

    static let setItems = [setItemsCalled, setItemsItems, setItemsAnimated]
    private static let setItemsCalledString = UUIDKeyString()
    private static let setItemsItemsString = UUIDKeyString()
    private static let setItemsAnimatedString = UUIDKeyString()
    static let setItemsCalled = ObjectAssociationKey(setItemsCalledString)
    static let setItemsItems = ObjectAssociationKey(setItemsItemsString)
    static let setItemsAnimated = ObjectAssociationKey(setItemsAnimatedString)

}


public extension UINavigationBar {

    /// Indicates whether the `pushItem(_:animated:)` method has been called on this object.
    public final var pushItemCalled: Bool {
        get {
            return booleanAssociation(
                for: UINavigationBarSpyCaptureKeys.pushItemCalled,
                defaultValue: false
            )
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.pushItemCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the item passed to the `pushItem(_:animated:)` method, if called.
    public final var pushItemItem: UINavigationItem? {
        get {
            return association(for: UINavigationBarSpyCaptureKeys.pushItemItem) as? UINavigationItem
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.pushItemItem
            guard let item = newValue else {
                return removeAssociation(for: key)
            }

            associate(item, with: key)
        }
    }


    /// Provides the animation flag passed to the `pushItem(_:animated:)` method, if called.
    public final var pushItemAnimated: Bool? {
        get {
            return booleanAssociation(for: UINavigationBarSpyCaptureKeys.pushItemAnimated)
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.pushItemAnimated
            guard let animated = newValue, animated else {
                    return removeAssociation(for: key)
            }

            associate(animated, with: key)
        }
    }

    
    /// Indicates whether the `popItem(animated:)` method has been called on this object.
    public final var popItemCalled: Bool {
        get {
            return booleanAssociation(
                for: UINavigationBarSpyCaptureKeys.popItemCalled,
                defaultValue: false
            )
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.popItemCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the item passed to the `popItem(animated:)` method, if called.
    public final var popItemAnimated: Bool? {
        get {
            return booleanAssociation(for: UINavigationBarSpyCaptureKeys.popItemAnimated)
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.popItemAnimated
            guard let animated = newValue, animated else {
                return removeAssociation(for: key)
            }

            associate(animated, with: key)
        }
    }


    /// Indicates whether the `setItems(_:animated:)` method has been called on this object.
    public final var setItemsCalled: Bool {
        get {
            return booleanAssociation(
                for: UINavigationBarSpyCaptureKeys.setItemsCalled,
                defaultValue: false
            )
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.setItemsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the item passed to the `setItems(_:animated:)` method, if called.
    public final var setItemsItems: [UINavigationItem]? {
        get {
            return association(for: UINavigationBarSpyCaptureKeys.setItemsItems) as? [UINavigationItem]
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.setItemsItems
            guard let items = newValue else {
                return removeAssociation(for: key)
            }

            associate(items, with: key)
        }
    }


    /// Provides the animation flag passed to the `setItems(_:animated:)` method, if called.
    public final var setItemsAnimated: Bool? {
        get {
            return booleanAssociation(for: UINavigationBarSpyCaptureKeys.setItemsAnimated)
        }
        set {
            let key = UINavigationBarSpyCaptureKeys.setItemsAnimated
            guard let animated = newValue, animated else {
                return removeAssociation(for: key)
            }

            associate(animated, with: key)
        }
    }

}
