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

    private static let calledSuffix = "Called"
    private static let animatedSuffix = "Animated"

    static let pushItem: [SpyKey] = [
        pushItemCalled,
        pushItemItem,
        pushItemAnimated
    ]

    private static let pushItemBase = "pushItem"
    static let pushItemCalled = ObjectAssociationKey(pushItemBase + calledSuffix)
    static let pushItemItem = ObjectAssociationKey(pushItemBase + "Item")
    static let pushItemAnimated = ObjectAssociationKey(pushItemBase + animatedSuffix)

    static let popItem: [SpyKey] = [popItemCalled, popItemAnimated]
    private static let popItemBase = "popItem"
    static let popItemCalled = ObjectAssociationKey(popItemBase + calledSuffix)
    static let popItemAnimated = ObjectAssociationKey(popItemBase + animatedSuffix)

    static let setItems: [SpyKey] = [
        setItemsCalled,
        setItemsItems,
        setItemsAnimated
    ]

    private static let setItemsBase = "setItems"
    static let setItemsCalled = ObjectAssociationKey(setItemsBase + calledSuffix)
    static let setItemsItems = ObjectAssociationKey(setItemsBase + "Items")
    static let setItemsAnimated = ObjectAssociationKey(setItemsBase + animatedSuffix)

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
