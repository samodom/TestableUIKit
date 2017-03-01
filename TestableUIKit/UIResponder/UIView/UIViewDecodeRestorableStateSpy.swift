//
//  UIViewDecodeRestorableStateSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/10/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let decodeRestorableStateCalledKeyString = UUIDKeyString()
    private static let decodeRestorableStateCalledKey =
        ObjectAssociationKey(decodeRestorableStateCalledKeyString)
    private static let decodeRestorableStateCalledReference =
        SpyEvidenceReference(key: decodeRestorableStateCalledKey)

    private static let decodeRestorableStateCoderKeyString = UUIDKeyString()
    private static let decodeRestorableStateCoderKey =
        ObjectAssociationKey(decodeRestorableStateCoderKeyString)
    private static let decodeRestorableStateCoderReference =
        SpyEvidenceReference(key: decodeRestorableStateCoderKey)

    private static let decodeRestorableStateCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.decodeRestorableState(with:)),
        spy: #selector(UIView.spy_decodeRestorableState(with:))
    )


    /// Spy controller for ensuring that a subclass calls its superclass implementation
    /// of `decodeRestorableState(with:)` when the same method is invoked on it.
    public enum DecodeRestorableStateSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.indirect
        public static let coselectors: Set = [decodeRestorableStateCoselectors]
        public static let evidence: Set = [
            decodeRestorableStateCalledReference,
            decodeRestorableStateCoderReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `decodeRestorableState(with:)`
    dynamic public func spy_decodeRestorableState(with coder: NSCoder) {
        superclassDecodeRestorableStateCalled = true
        superclassDecodeRestorableStateCoder = coder

        spy_decodeRestorableState(with: coder)
    }


    /// Indicates whether the `decodeRestorableState(with:)` method has been called on this object's superclass.
    public final var superclassDecodeRestorableStateCalled: Bool {
        get {
            return loadEvidence(with: UIView.decodeRestorableStateCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.decodeRestorableStateCalledReference)
        }
    }


    /// Provides the captured coder from a call to the `decodeRestorableState(with:)` method, if called.
    public final var superclassDecodeRestorableStateCoder: NSCoder? {
        get {
            return loadEvidence(with: UIView.decodeRestorableStateCoderReference) as? NSCoder
        }
        set {
            let reference = UIView.decodeRestorableStateCoderReference
            guard let coder = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(coder, with: reference)
        }
    }

}
