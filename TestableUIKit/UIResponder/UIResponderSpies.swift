//
//  UIResponderSpies.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


extension UIResponder: Spy {}

enum UIResponderOriginalSelectors {
    static let becomeFirstResponder = #selector(UIResponder.becomeFirstResponder)
    static let resignFirstResponder = #selector(UIResponder.resignFirstResponder)
}

enum UIResponderSpySelectors {
    static let becomeFirstResponder = #selector(UIResponder.spy_becomeFirstResponder)
    static let resignFirstResponder = #selector(UIResponder.spy_resignFirstResponder)
}


public enum UIResponderSpyAssociations {
    public static let becomeFirstResponder = MethodAssociation(
        forClass: UIResponder.self,
        ofType: .instance,
        originalSelector: UIResponderOriginalSelectors.becomeFirstResponder,
        alternateSelector: UIResponderSpySelectors.becomeFirstResponder
    )

    public static let resignFirstResponder = MethodAssociation(
        forClass: UIResponder.self,
        ofType: .instance,
        originalSelector: UIResponderOriginalSelectors.resignFirstResponder,
        alternateSelector: UIResponderSpySelectors.resignFirstResponder
    )
}


public extension UIResponder {

    //  MARK: - Spying on `becomeFirstResponder`

    /// Spies on calls to `becomeFirstResponder` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnBecomeFirstResponder(in context: NullaryVoidClosure) {
        UIResponderSpyAssociations.becomeFirstResponder.withAlternateImplementation(context: context)
        clearSpyKeys(UIResponderSpyCaptureKeys.becomeFirstResponder)
    }


    /// Begins spying on calls to `becomeFirstResponder`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnBecomeFirstResponder`
    public final func beginSpyingOnBecomeFirstResponder() {
        UIResponderSpyAssociations.becomeFirstResponder.useAlternateImplementation()
    }


    /// Ends spying on calls to `becomeFirstResponder`
    public final func endSpyingOnBecomeFirstResponder() {
        UIResponderSpyAssociations.becomeFirstResponder.useOriginalImplementation()
        clearSpyKeys(UIResponderSpyCaptureKeys.becomeFirstResponder)
    }


    /// Spy method that replaces the true implementation of `becomeFirstResponder`
    public func spy_becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true

        guard forwardsMethodCalls(forSelector: UIResponderOriginalSelectors.becomeFirstResponder) else {
            return true
        }

        return spy_becomeFirstResponder()
    }


    //  MARK: - Spying on `resignFirstResponder`

    /// Spies on calls to `resignFirstResponder` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnResignFirstResponder(in context: NullaryVoidClosure) {
        UIResponderSpyAssociations.resignFirstResponder.withAlternateImplementation(context: context)
        clearSpyKeys(UIResponderSpyCaptureKeys.resignFirstResponder)
    }


    /// Begins spying on calls to `resignFirstResponder`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnResignFirstResponder`
    public final func beginSpyingOnResignFirstResponder() {
        UIResponderSpyAssociations.resignFirstResponder.useAlternateImplementation()
    }


    /// Ends spying on calls to `resignFirstResponder`
    public final func endSpyingOnResignFirstResponder() {
        UIResponderSpyAssociations.resignFirstResponder.useOriginalImplementation()
        clearSpyKeys(UIResponderSpyCaptureKeys.resignFirstResponder)
    }


    /// Spy method that replaces the true implementation of `resignFirstResponder`
    public func spy_resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true

        guard forwardsMethodCalls(forSelector: UIResponderOriginalSelectors.resignFirstResponder) else {
            return true
        }

        return spy_resignFirstResponder()
    }

}
