//
//  UINavigationBarSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


fileprivate enum UINavigationBarOriginalSelectors {
    static let pushItem = #selector(UINavigationBar.pushItem(_:animated:))
    static let popItem = #selector(UINavigationBar.popItem(animated:))
    static let setItems = #selector(UINavigationBar.setItems(_:animated:))
}

fileprivate enum UINavigationBarSpySelectors {
    static let pushItem = #selector(UINavigationBar.spy_pushItem(_:animated:))
    static let popItem = #selector(UINavigationBar.spy_popItem(animated:))
    static let setItems = #selector(UINavigationBar.spy_setItems(_:animated:))
}


public enum UINavigationBarSpyAssociations {

    public static let pushItem = MethodAssociation(
        forClass: UINavigationBar.self,
        ofType: .instance,
        originalSelector: UINavigationBarOriginalSelectors.pushItem,
        alternateSelector: UINavigationBarSpySelectors.pushItem
    )

    public static let popItem = MethodAssociation(
        forClass: UINavigationBar.self,
        ofType: .instance,
        originalSelector: UINavigationBarOriginalSelectors.popItem,
        alternateSelector: UINavigationBarSpySelectors.popItem
    )

    public static let setItems = MethodAssociation(
        forClass: UINavigationBar.self,
        ofType: .instance,
        originalSelector: UINavigationBarOriginalSelectors.setItems,
        alternateSelector: UINavigationBarSpySelectors.setItems
    )

}


public extension UINavigationBar {

    //  MARK: - `pushItem(_:animated:)`

    /// Spies on calls to `pushItem(_:animated:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnPushItem(in context: SpyExecutionContext) {
        UINavigationBarSpyAssociations.pushItem.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.pushItem)
    }


    /// Begins spying on calls to `pushItem(_:animated:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnPushItem`
    public final func beginSpyingOnPushItem() {
        UINavigationBarSpyAssociations.pushItem.useAlternateImplementation()
    }


    /// Ends spying on calls to `pushItem(_:animated:)`
    public final func endSpyingOnPushItem() {
        UINavigationBarSpyAssociations.pushItem.useOriginalImplementation()
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.pushItem)
    }


    /// Spy method that replaces the true implementation of `pushItem(_:animated:)`
    public func spy_pushItem(_ item: UINavigationItem, animated: Bool) {
        pushItemCalled = true
        pushItemItem = item
        pushItemAnimated = animated

        guard forwardsMethodCalls(for: UINavigationBarSpyAssociations.pushItem.originalSelector) else {
            return
        }

        spy_pushItem(item, animated: animated)
    }


    //  MARK: - `popItem(animated:)`

    /// Spies on calls to `popItem(animated:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnPopItem(in context: SpyExecutionContext) {
        UINavigationBarSpyAssociations.popItem.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.popItem)
    }


    /// Begins spying on calls to `popItem(animated:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnPopItem`
    public final func beginSpyingOnPopItem() {
        UINavigationBarSpyAssociations.popItem.useAlternateImplementation()
    }


    /// Ends spying on calls to `popItem(animated:)`
    public final func endSpyingOnPopItem() {
        UINavigationBarSpyAssociations.popItem.useOriginalImplementation()
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.popItem)
    }


    /// Spy method that replaces the true implementation of `popItem(animated:)`
    public func spy_popItem(animated: Bool) -> UINavigationItem? {
        popItemCalled = true
        popItemAnimated = animated

        guard forwardsMethodCalls(for: UINavigationBarSpyAssociations.popItem.originalSelector) else {
            return nil
        }

        return spy_popItem(animated: animated)
    }


    /// Spies on calls to `setItems(_:animated:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnSetItems(in context: SpyExecutionContext) {
        UINavigationBarSpyAssociations.setItems.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.setItems)
    }


    /// Begins spying on calls to `setItems(_:animated:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnSetItems`
    public final func beginSpyingOnSetItems() {
        UINavigationBarSpyAssociations.setItems.useAlternateImplementation()
    }


    /// Ends spying on calls to `setItems(_:animated:)`
    public final func endSpyingOnSetItems() {
        UINavigationBarSpyAssociations.setItems.useOriginalImplementation()
        clearSpyAssociations(keys: UINavigationBarSpyCaptureKeys.setItems)
    }


    /// Spy method that replaces the true implementation of `setItems(_:animated:)`
    public func spy_setItems(_ items: [UINavigationItem]?, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        guard forwardsMethodCalls(for: UINavigationBarSpyAssociations.setItems.originalSelector) else {
            return
        }

        spy_setItems(items, animated: animated)
    }

}
