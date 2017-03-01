//
//  UIResponderBecomeFirstResponderSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger
import TestSwagger


public extension UIResponder {

    private static let becomeFirstResponderCalledString = UUIDKeyString()
    private static let becomeFirstResponderCalledKey =
        ObjectAssociationKey(becomeFirstResponderCalledString)
    private static let becomeFirstResponderCalledReference =
        SpyEvidenceReference(key: becomeFirstResponderCalledKey)


    /// Spy controller for ensuring a responder has had `becomeFirstResponder` called on it.
    public enum BecomeFirstResponderSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIResponder.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIResponder.becomeFirstResponder),
                spy: #selector(UIResponder.spy_becomeFirstResponder)
            )
        ] as Set
        public static let evidence = [becomeFirstResponderCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `becomeFirstResponder`
    public func spy_becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true
        return spy_becomeFirstResponder()
    }


    /// Indicates whether the `becomeFirstResponder` method has been called on this object.
    public final var becomeFirstResponderCalled: Bool {
        get {
            return loadEvidence(with: UIResponder.becomeFirstResponderCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UIResponder.becomeFirstResponderCalledReference)
        }
    }

}
