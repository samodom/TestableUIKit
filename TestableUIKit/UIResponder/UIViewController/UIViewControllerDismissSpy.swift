//
//  UIViewControllerDismissSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let dismissCalledString = UUIDKeyString()
    private static let dismissCalledKey = ObjectAssociationKey(dismissCalledString)
    private static let dismissCalledReference = SpyEvidenceReference(key: dismissCalledKey)

    private static let dismissAnimatedString = UUIDKeyString()
    private static let dismissAnimatedKey = ObjectAssociationKey(dismissAnimatedString)
    private static let dismissAnimatedReference = SpyEvidenceReference(key: dismissAnimatedKey)

    private static let dismissCompletionString = UUIDKeyString()
    private static let dismissCompletionKey = ObjectAssociationKey(dismissCompletionString)
    private static let dismissCompletionReference = SpyEvidenceReference(key: dismissCompletionKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `dismiss(animated:completion:)` invoked.
    public enum DismissSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.dismiss(animated:completion:)),
                spy: #selector(UIViewController.spy_dismiss(animated:completion:))
            )
        ] as Set
        public static let evidence = [
            dismissCalledReference,
            dismissAnimatedReference,
            dismissCompletionReference
        ] as Set
        public static var forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `dismiss(animated:completion:)`
    public func spy_dismiss(animated: Bool,completion: @escaping NullaryVoidClosure) {
        dismissCalled = true
        dismissAnimated = animated

        if UIViewController.DismissSpyController.forwardsInvocations {
            spy_dismiss(animated: animated, completion: completion)
        }
        else {
            dismissCompletion = completion
        }
    }


    /// Indicates whether the `dismiss(animated:completion:)` method has been 
    /// called on this object.
    public final var dismissCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.dismissCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.dismissCalledReference)
        }
    }


    /// Provides the animation flag passed to `dismiss(animated:completion:)` if called.
    public final var dismissAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.dismissAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.dismissAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }


    /// Provides the completion handler passed to `dismiss(animated:completion:)` if called.
    public final var dismissCompletion: NullaryVoidClosure? {
        get {
            return loadEvidence(with: UIViewController.dismissCompletionReference) as? NullaryVoidClosure
        }
        set {
            let reference = UIViewController.dismissCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
