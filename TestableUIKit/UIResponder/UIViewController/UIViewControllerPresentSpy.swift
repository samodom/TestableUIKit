//
//  UIViewControllerPresentSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let presentCalledString = UUIDKeyString()
    private static let presentCalledKey = ObjectAssociationKey(presentCalledString)
    private static let presentCalledReference = SpyEvidenceReference(key: presentCalledKey)

    private static let presentControllerString = UUIDKeyString()
    private static let presentControllerKey = ObjectAssociationKey(presentControllerString)
    private static let presentControllerReference = SpyEvidenceReference(key: presentControllerKey)

    private static let presentAnimatedString = UUIDKeyString()
    private static let presentAnimatedKey = ObjectAssociationKey(presentAnimatedString)
    private static let presentAnimatedReference = SpyEvidenceReference(key: presentAnimatedKey)

    private static let presentCompletionString = UUIDKeyString()
    private static let presentCompletionKey = ObjectAssociationKey(presentCompletionString)
    private static let presentCompletionReference = SpyEvidenceReference(key: presentCompletionKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `present(_:animated:completion:)` invoked.
    public enum PresentSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.present(_:animated:completion:)),
                spy: #selector(UIViewController.spy_present(_:animated:completion:))
            )
        ] as Set
        public static let evidence = [
            presentCalledReference,
            presentControllerReference,
            presentAnimatedReference,
            presentCompletionReference
        ] as Set
        public static var forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `present(_:animated:completion:)`
    public func spy_present(
        _ controller: UIViewController,
        animated: Bool,
        completion: @escaping NullaryVoidClosure
        ) {

        presentCalled = true
        presentController = controller
        presentAnimated = animated

        if UIViewController.PresentSpyController.forwardsInvocations {
            spy_present(controller, animated: animated, completion: completion)
        }
        else {
            presentCompletion = completion
        }
    }


    /// Indicates whether the `present(_:animated:completion:)` method has been 
    /// called on this object.
    public final var presentCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.presentCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.presentCalledReference)
        }
    }


    /// Provides the view controller passed to `present(_:animated:completion:)` if called.
    public final var presentController: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.presentControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.presentControllerReference
            guard let controller = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controller, with: reference)
        }
    }


    /// Provides the animation flag passed to `present(_:animated:completion:)` if called.
    public final var presentAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.presentAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.presentAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }


    /// Provides the completion handler passed to `present(_:animated:completion:)` if called.
    public final var presentCompletion: NullaryVoidClosure? {
        get {
            return loadEvidence(with: UIViewController.presentCompletionReference) as? NullaryVoidClosure
        }
        set {
            let reference = UIViewController.presentCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
