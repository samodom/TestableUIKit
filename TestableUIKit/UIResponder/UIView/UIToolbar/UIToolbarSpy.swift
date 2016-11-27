//
//  UIToolbarSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


enum UIToolbarOriginalSelectors {
    static let setItems = #selector(UIToolbar.setItems(_:animated:))
}

enum UIToolbarSpySelectors {
    static let setItems = #selector(UIToolbar.spy_setItems(_:animated:))
}


public enum UIToolbarSpyAssociations {

    public static let setItems = MethodAssociation(
        forClass: UIToolbar.self,
        ofType: .instance,
        originalSelector: UIToolbarOriginalSelectors.setItems,
        alternateSelector: UIToolbarSpySelectors.setItems
    )

}


public extension UIToolbar {

    /// Spies on calls to `setItems(_:animated:)` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnSetItems(in context: NullaryVoidClosure) {
        UIToolbarSpyAssociations.setItems.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIToolbarSpyCaptureKeys.setItems)
    }


    /// Begins spying on calls to `setItems(_:animated:)`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnSetItems`
    public final func beginSpyingOnSetItems() {
        UIToolbarSpyAssociations.setItems.useAlternateImplementation()
    }


    /// Ends spying on calls to `setItems(_:animated:)`
    public final func endSpyingOnSetItems() {
        UIToolbarSpyAssociations.setItems.useOriginalImplementation()
        clearSpyAssociations(keys: UIToolbarSpyCaptureKeys.setItems)
    }


    /// Spy method that replaces the true implementation of `setItems(_:animated:)`
    public func spy_setItems(_ items: [UIBarButtonItem]?, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        guard forwardsMethodCalls(for: UIToolbarOriginalSelectors.setItems) else {
            return
        }

        spy_setItems(items, animated: animated)
    }

}
