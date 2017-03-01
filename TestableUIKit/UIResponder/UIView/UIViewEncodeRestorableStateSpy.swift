//
//  UIViewEncodeRestorableStateSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/10/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let encodeRestorableStateCalledKeyString = UUIDKeyString()
    private static let encodeRestorableStateCalledKey =
        ObjectAssociationKey(encodeRestorableStateCalledKeyString)
    private static let encodeRestorableStateCalledReference =
        SpyEvidenceReference(key: encodeRestorableStateCalledKey)

    private static let encodeRestorableStateCoderKeyString = UUIDKeyString()
    private static let encodeRestorableStateCoderKey =
        ObjectAssociationKey(encodeRestorableStateCoderKeyString)
    private static let encodeRestorableStateCoderReference =
        SpyEvidenceReference(key: encodeRestorableStateCoderKey)

    private static let encodeRestorableStateCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.encodeRestorableState(with:)),
        spy: #selector(UIView.spy_encodeRestorableState(with:))
    )


    /// Spy controller for ensuring that a subclass calls its superclass implementation
    /// of `encodeRestorableState(with:)` when the same method is invoked on it.
    public enum EncodeRestorableStateSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.indirect
        public static let coselectors: Set = [encodeRestorableStateCoselectors]
        public static let evidence: Set = [
            encodeRestorableStateCalledReference,
            encodeRestorableStateCoderReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `encodeRestorableState(with:)`
    dynamic public func spy_encodeRestorableState(with coder: NSCoder) {
        superclassEncodeRestorableStateCalled = true
        superclassEncodeRestorableStateCoder = coder

        spy_encodeRestorableState(with: coder)
    }


    /// Indicates whether the `encodeRestorableState(with:)` method has been called on this object's superclass.
    public final var superclassEncodeRestorableStateCalled: Bool {
        get {
            return loadEvidence(with: UIView.encodeRestorableStateCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.encodeRestorableStateCalledReference)
        }
    }


    /// Provides the captured coder from a call to the `encodeRestorableState(with:)` method, if called.
    public final var superclassEncodeRestorableStateCoder: NSCoder? {
        get {
            return loadEvidence(with: UIView.encodeRestorableStateCoderReference) as? NSCoder
        }
        set {
            let reference = UIView.encodeRestorableStateCoderReference
            guard let coder = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(coder, with: reference)
        }
    }

}
