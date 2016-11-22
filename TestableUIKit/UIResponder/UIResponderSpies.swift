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

public extension UIResponder {

    fileprivate enum SpyCaptureKeys {
        private static let calledSuffix = "Called"

        static let becomeFirstResponder = [becomeFirstResponderCalled]
        static let becomeFirstResponderCalled = ObjectAssociationKey("becomeFirstResponder" + calledSuffix)

        static let resignFirstResponder = [resignFirstResponderCalled]
        static let resignFirstResponderCalled = ObjectAssociationKey("resignFirstResponder" + calledSuffix)
    }


    /// Indicates whether the `becomeFirstResponder` method has been called on this object.
    public final var becomeFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: SpyCaptureKeys.becomeFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: SpyCaptureKeys.becomeFirstResponderCalled)
        }
    }


    /// Indicates whether the `resignFirstResponder` method has been called on this object.
    public final var resignFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: SpyCaptureKeys.resignFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: SpyCaptureKeys.resignFirstResponderCalled)
        }
    }
    
}


public extension UIResponder {

    private enum OriginalSelectors {
        static let becomeFirstResponder = #selector(UIResponder.becomeFirstResponder)
        static let resignFirstResponder = #selector(UIResponder.resignFirstResponder)
    }

    private enum SpySelectors {
        static let becomeFirstResponder = #selector(UIResponder.spy_becomeFirstResponder)
        static let resignFirstResponder = #selector(UIResponder.spy_resignFirstResponder)
    }

    public enum SpyAssociations {
        public static let becomeFirstResponder = MethodAssociation(
            forClass: UIResponder.self,
            ofType: .instance,
            originalSelector: OriginalSelectors.becomeFirstResponder,
            alternateSelector: SpySelectors.becomeFirstResponder
        )

        public static let resignFirstResponder = MethodAssociation(
            forClass: UIResponder.self,
            ofType: .instance,
            originalSelector: OriginalSelectors.resignFirstResponder,
            alternateSelector: SpySelectors.resignFirstResponder
        )
    }


    //  MARK: - Spying on `becomeFirstResponder`

    /// Spies on calls to `becomeFirstResponder` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnBecomeFirstResponder(in context: NullaryVoidClosure) {
        SpyAssociations.becomeFirstResponder.withAlternateImplementation(context: context)
        clearSpyKeys(SpyCaptureKeys.becomeFirstResponder)
    }


    /// Begins spying on calls to `becomeFirstResponder`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnBecomeFirstResponder`
    public final func beginSpyingOnBecomeFirstResponder() {
        SpyAssociations.becomeFirstResponder.useAlternateImplementation()
    }


    /// Ends spying on calls to `becomeFirstResponder`
    public final func endSpyingOnBecomeFirstResponder() {
        SpyAssociations.becomeFirstResponder.useOriginalImplementation()
        clearSpyKeys(SpyCaptureKeys.becomeFirstResponder)
    }


    /// Spy method that replaces the true implementation of `becomeFirstResponder`
    public func spy_becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true

        guard forwardsMethodCalls(forSelector: OriginalSelectors.becomeFirstResponder) else {
            return true
        }

        return spy_becomeFirstResponder()
    }


    //  MARK: - Spying on `resignFirstResponder`

    /// Spies on calls to `resignFirstResponder` and executes the provided context while the spy method is active
    /// - parameter context: Logic to execute while the spy method is active.
    public final func spyOnResignFirstResponder(in context: NullaryVoidClosure) {
        SpyAssociations.resignFirstResponder.withAlternateImplementation(context: context)
        clearSpyKeys(SpyCaptureKeys.resignFirstResponder)
    }


    /// Begins spying on calls to `resignFirstResponder`
    /// - note: Calls to this method should be balanced by calls to `endSpyingOnResignFirstResponder`
    public final func beginSpyingOnResignFirstResponder() {
        SpyAssociations.resignFirstResponder.useAlternateImplementation()
    }


    /// Ends spying on calls to `resignFirstResponder`
    public final func endSpyingOnResignFirstResponder() {
        SpyAssociations.resignFirstResponder.useOriginalImplementation()
        clearSpyKeys(SpyCaptureKeys.resignFirstResponder)
    }


    /// Spy method that replaces the true implementation of `resignFirstResponder`
    public func spy_resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true

        guard forwardsMethodCalls(forSelector: OriginalSelectors.resignFirstResponder) else {
            return true
        }

        return spy_resignFirstResponder()
    }

}
