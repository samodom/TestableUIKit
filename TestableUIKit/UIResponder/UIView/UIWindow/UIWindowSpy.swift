//
//  UIWindowSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/26/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


fileprivate enum UIWindowOriginalSelectors {
    static let makeKey = #selector(UIWindow.makeKey)
    static let makeKeyAndVisible = #selector(UIWindow.makeKeyAndVisible)
}

fileprivate enum UIWindowSpySelectors {
    static let makeKey = #selector(UIWindow.spy_makeKey)
    static let makeKeyAndVisible = #selector(UIWindow.spy_makeKeyAndVisible)
}


public enum UIWindowSpyAssociations {

    public static let makeKey = MethodAssociation(
        forClass: UIWindow.self,
        ofType: .instance,
        originalSelector: UIWindowOriginalSelectors.makeKey,
        alternateSelector: UIWindowSpySelectors.makeKey
    )

    public static let makeKeyAndVisible = MethodAssociation(
        forClass: UIWindow.self,
        ofType: .instance,
        originalSelector: UIWindowOriginalSelectors.makeKeyAndVisible,
        alternateSelector: UIWindowSpySelectors.makeKeyAndVisible
    )

}


public extension UIWindow {

    //  MARK: - Spying on `makeKey`

    /// Spies on calls to `makeKey` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMakeKey(in context: NullaryVoidClosure) {
        UIWindowSpyAssociations.makeKey.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWindowSpyCaptureKeys.makeKey)
    }


    /// Begins spying on calls to `makeKey`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMakeKey`
    public final func beginSpyingOnMakeKey() {
        UIWindowSpyAssociations.makeKey.useAlternateImplementation()
    }


    /// Ends spying on calls to `makeKey`
    public final func endSpyingOnMakeKey() {
        UIWindowSpyAssociations.makeKey.useOriginalImplementation()
        clearSpyAssociations(keys: UIWindowSpyCaptureKeys.makeKey)
    }


    /// Spy method that replaces the true implementation of `makeKey`
    public func spy_makeKey() {
        makeKeyCalled = true

        guard forwardsMethodCalls(for: UIWindowSpyAssociations.makeKey.originalSelector) else {
            return
        }

        spy_makeKey()
    }


    //  MARK: - Spying on `makeKeyAndVisible`

    /// Spies on calls to `makeKeyAndVisible` and executes
    /// the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnMakeKeyAndVisible(in context: NullaryVoidClosure) {
        UIWindowSpyAssociations.makeKeyAndVisible.withAlternateImplementation(context: context)
        clearSpyAssociations(keys: UIWindowSpyCaptureKeys.makeKeyAndVisible)
    }


    /// Begins spying on calls to `makeKeyAndVisible`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnMakeKeyAndVisible`
    public final func beginSpyingOnMakeKeyAndVisible() {
        UIWindowSpyAssociations.makeKeyAndVisible.useAlternateImplementation()
    }


    /// Ends spying on calls to `makeKeyAndVisible`
    public final func endSpyingOnMakeKeyAndVisible() {
        UIWindowSpyAssociations.makeKeyAndVisible.useOriginalImplementation()
        clearSpyAssociations(keys: UIWindowSpyCaptureKeys.makeKeyAndVisible)
    }


    /// Spy method that replaces the true implementation of `makeKeyAndVisible`
    public func spy_makeKeyAndVisible() {
        makeKeyAndVisibleCalled = true

        guard forwardsMethodCalls(for: UIWindowSpyAssociations.makeKeyAndVisible.originalSelector) else {
            return
        }

        spy_makeKeyAndVisible()
    }

}
