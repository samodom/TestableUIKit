//
//  UIResponderResignFirstResponderSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger
import TestSwagger


public extension UIResponder {

    private static let resignFirstResponderCalledString = UUIDKeyString()
    private static let resignFirstResponderCalledKey =
        ObjectAssociationKey(resignFirstResponderCalledString)
    private static let resignFirstResponderCalledReference =
        SpyEvidenceReference(key: resignFirstResponderCalledKey)


    /// Spy controller for ensuring a responder has had `resignFirstResponder` called on it.
    public enum ResignFirstResponderSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIResponder.self
        public static let vector = SpyVector.direct
        public static let coselectors =
            [
                SpyCoselectors(
                    methodType: .instance,
                    original: #selector(UIResponder.resignFirstResponder),
                    spy: #selector(UIResponder.spy_resignFirstResponder)
                )
        ] as Set
        public static let evidence = [resignFirstResponderCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `resignFirstResponder`
    public func spy_resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true
        return spy_resignFirstResponder()
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
