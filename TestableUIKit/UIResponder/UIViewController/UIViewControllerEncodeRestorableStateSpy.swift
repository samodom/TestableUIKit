//
//  UIViewControllerEncodeRestorableStateSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let encodeRestorableStateCalledString = UUIDKeyString()
    private static let encodeRestorableStateCalledKey = ObjectAssociationKey(encodeRestorableStateCalledString)
    private static let encodeRestorableStateCalledReference = SpyEvidenceReference(key: encodeRestorableStateCalledKey)

    private static let encodeRestorableStateCoderString = UUIDKeyString()
    private static let encodeRestorableStateCoderKey = ObjectAssociationKey(encodeRestorableStateCoderString)
    private static let encodeRestorableStateCoderReference = SpyEvidenceReference(key: encodeRestorableStateCoderKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `encodeRestorableState(with:)`.
    public enum EncodeRestorableStateSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.encodeRestorableState(with:)),
                spy: #selector(UIViewController.spy_encodeRestorableState(with:))
            )
        ] as Set
        public static let evidence = [
            encodeRestorableStateCalledReference,
            encodeRestorableStateCoderReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `encodeRestorableState(with:)`
    public func spy_encodeRestorableState(with coder: NSCoder) {
        superclassEncodeRestorableStateCalled = true
        superclassEncodeRestorableStateCoder = coder

        spy_encodeRestorableState(with: coder)
    }


    /// Indicates whether the `encodeRestorableState(with:)` method has been called on this object's superclass.
    public final var superclassEncodeRestorableStateCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.encodeRestorableStateCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.encodeRestorableStateCalledReference)
        }
    }


    /// Provides the editing flag passed to `encodeRestorableState(with:)` if called.
    public final var superclassEncodeRestorableStateCoder: NSCoder? {
        get {
            return loadEvidence(with: UIViewController.encodeRestorableStateCoderReference) as? NSCoder
        }
        set {
            let reference = UIViewController.encodeRestorableStateCoderReference
            guard let coder = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(coder, with: reference)
        }
    }

}
