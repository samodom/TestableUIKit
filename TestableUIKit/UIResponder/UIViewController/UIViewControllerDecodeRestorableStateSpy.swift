//
//  UIViewControllerDecodeRestorableStateSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let decodeRestorableStateCalledString = UUIDKeyString()
    private static let decodeRestorableStateCalledKey = ObjectAssociationKey(decodeRestorableStateCalledString)
    private static let decodeRestorableStateCalledReference = SpyEvidenceReference(key: decodeRestorableStateCalledKey)

    private static let decodeRestorableStateCoderString = UUIDKeyString()
    private static let decodeRestorableStateCoderKey = ObjectAssociationKey(decodeRestorableStateCoderString)
    private static let decodeRestorableStateCoderReference = SpyEvidenceReference(key: decodeRestorableStateCoderKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `decodeRestorableState(with:)`.
    public enum DecodeRestorableStateSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.decodeRestorableState(with:)),
                spy: #selector(UIViewController.spy_decodeRestorableState(with:))
            )
        ] as Set
        public static let evidence = [
            decodeRestorableStateCalledReference,
            decodeRestorableStateCoderReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `decodeRestorableState(with:)`
    public func spy_decodeRestorableState(with coder: NSCoder) {
        superclassDecodeRestorableStateCalled = true
        superclassDecodeRestorableStateCoder = coder

        spy_decodeRestorableState(with: coder)
    }


    /// Indicates whether the `decodeRestorableState(with:)` method has been called on this object's superclass.
    public final var superclassDecodeRestorableStateCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.decodeRestorableStateCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.decodeRestorableStateCalledReference)
        }
    }


    /// Provides the editing flag passed to `decodeRestorableState(with:)` if called.
    public final var superclassDecodeRestorableStateCoder: NSCoder? {
        get {
            return loadEvidence(with: UIViewController.decodeRestorableStateCoderReference) as? NSCoder
        }
        set {
            let reference = UIViewController.decodeRestorableStateCoderReference
            guard let coder = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(coder, with: reference)
        }
    }

}
