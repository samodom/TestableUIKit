//
//  UIResponderSpies.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger
import TestSwagger


extension UIResponder: ObjectSpyable {}


public extension UIResponder { // MARK: Spying on `becomeFirstResponder`


    /// Spy controller for spying on `becomeFirstResponder`.
    public enum BecomeFirstResponderSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIResponder.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set<SpyCoselectors> = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIResponder.becomeFirstResponder),
                spy: #selector(UIResponder.spy_becomeFirstResponder)
            )
        ]
        public static let evidence = [becomeFirstResponderCalledReference] as Set
        public static let forwardingBehavior = MethodForwardingBehavior.always
    }


    /// Spy method that replaces the true implementation of `becomeFirstResponder`
    public func spy_becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true
        return spy_becomeFirstResponder()
    }

}


public extension UIResponder { // MARK: Spying on `resignFirstResponder`

    /// Spy controller for spying on `resignFirstResponder`.
    public enum ResignFirstResponderSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIResponder.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set<SpyCoselectors> =
            [
                SpyCoselectors(
                    methodType: .instance,
                    original: #selector(UIResponder.resignFirstResponder),
                    spy: #selector(UIResponder.spy_resignFirstResponder)
                )
        ]
        public static let evidence = [resignFirstResponderCalledReference] as Set
        public static let forwardingBehavior = MethodForwardingBehavior.always
    }


    /// Spy method that replaces the true implementation of `resignFirstResponder`
    public func spy_resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true
        return spy_resignFirstResponder()
    }

}


fileprivate extension UIResponder { // MARK: Evidence references

    private static let becomeFirstResponderCalledString = UUIDKeyString()
    private static let becomeFirstResponderCalledKey =
        ObjectAssociationKey(becomeFirstResponderCalledString)
    static let becomeFirstResponderCalledReference =
        SpyEvidenceReference(key: becomeFirstResponderCalledKey)


    private static let resignFirstResponderCalledString = UUIDKeyString()
    private static let resignFirstResponderCalledKey =
        ObjectAssociationKey(resignFirstResponderCalledString)
    static let resignFirstResponderCalledReference =
        SpyEvidenceReference(key: resignFirstResponderCalledKey)

}


public extension UIResponder { // MARK: Evidence properties

    /// Indicates whether the `becomeFirstResponder` method has been called on this object.
    public final var becomeFirstResponderCalled: Bool {
        get {
            return loadEvidence(with: UIResponder.becomeFirstResponderCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UIResponder.becomeFirstResponderCalledReference)
        }
    }


    /// Indicates whether the `resignFirstResponder` method has been called on this object.
    public final var resignFirstResponderCalled: Bool {
        get {
            return loadEvidence(with: UIResponder.resignFirstResponderCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UIResponder.resignFirstResponderCalledReference)
        }
    }

}
