//
//  UIViewControllerTransitionSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let transitionCalledString = UUIDKeyString()
    private static let transitionCalledKey = ObjectAssociationKey(transitionCalledString)
    private static let transitionCalledReference = SpyEvidenceReference(key: transitionCalledKey)

    private static let transitionFromControllerString = UUIDKeyString()
    private static let transitionFromControllerKey = ObjectAssociationKey(transitionFromControllerString)
    private static let transitionFromControllerReference = SpyEvidenceReference(key: transitionFromControllerKey)

    private static let transitionToControllerString = UUIDKeyString()
    private static let transitionToControllerKey = ObjectAssociationKey(transitionToControllerString)
    private static let transitionToControllerReference = SpyEvidenceReference(key: transitionToControllerKey)

    private static let transitionDurationString = UUIDKeyString()
    private static let transitionDurationKey = ObjectAssociationKey(transitionDurationString)
    private static let transitionDurationReference = SpyEvidenceReference(key: transitionDurationKey)

    private static let transitionOptionsString = UUIDKeyString()
    private static let transitionOptionsKey = ObjectAssociationKey(transitionOptionsString)
    private static let transitionOptionsReference = SpyEvidenceReference(key: transitionOptionsKey)

    private static let transitionAnimationsString = UUIDKeyString()
    private static let transitionAnimationsKey = ObjectAssociationKey(transitionAnimationsString)
    private static let transitionAnimationsReference = SpyEvidenceReference(key: transitionAnimationsKey)

    private static let transitionCompletionString = UUIDKeyString()
    private static let transitionCompletionKey = ObjectAssociationKey(transitionCompletionString)
    private static let transitionCompletionReference = SpyEvidenceReference(key: transitionCompletionKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `transition(from:to:duration:options:animations:completion:)`.
    public enum TransitionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.transition(from:to:duration:options:animations:completion:)),
                spy: #selector(UIViewController.spy_transition(from:to:duration:options:animations:completion:))
            )
        ] as Set
        public static let evidence = [
            transitionCalledReference,
            transitionFromControllerReference,
            transitionToControllerReference,
            transitionDurationReference,
            transitionOptionsReference,
            transitionAnimationsReference,
            transitionCompletionReference
        ] as Set
        public static var forwardingBehavior = MethodForwardingBehavior.always
    }


    /// Spy method that replaces the true implementation of `transition(from:to:duration:options:animations:completion:)`
    public func spy_transition(
        from sourceController: UIViewController,
        to destinationController: UIViewController,
        duration: TimeInterval,
        options: UIViewAnimationOptions,
        animations: (() -> Void)?,
        completion: ((Bool) -> Void)?
        ) {

        superclassTransitionCalled = true
        superclassTransitionFromController = sourceController
        superclassTransitionToController = destinationController
        superclassTransitionDuration = duration
        superclassTransitionOptions = options

        if UIViewController.TransitionSpyController.forwardingBehavior.forwards {
            spy_transition(
                from: sourceController,
                to: destinationController,
                duration: duration,
                options: options,
                animations: animations,
                completion: completion
            )
        }
        else {
            superclassTransitionAnimations = animations
            superclassTransitionCompletion = completion
        }
    }


    /// Indicates whether the `transition(from:to:duration:options:animations:completion:)` method has been called on this object's superclass.
    public final var superclassTransitionCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.transitionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.transitionCalledReference)
        }
    }


    /// Provides the source controller passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionFromController: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.transitionFromControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.transitionFromControllerReference
            guard let source = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(source, with: reference)
        }
    }


    /// Provides the destination controller passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionToController: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.transitionToControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.transitionToControllerReference
            guard let destination = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(destination, with: reference)
        }
    }


    /// Provides the duration passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionDuration: TimeInterval? {
        get {
            return loadEvidence(with: UIViewController.transitionDurationReference) as? TimeInterval
        }
        set {
            let reference = UIViewController.transitionDurationReference
            guard let duration = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(duration, with: reference)
        }
    }


    /// Provides the options passed to `transition(from:to:duration:options:animations:completion:)`
    /// if called.
    public final var superclassTransitionOptions: UIViewAnimationOptions? {
        get {
            return loadEvidence(with: UIViewController.transitionOptionsReference) as? UIViewAnimationOptions
        }
        set {
            let reference = UIViewController.transitionOptionsReference
            guard let options = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(options, with: reference)
        }
    }


    /// Provides the animations closure passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionAnimations: UIViewAnimations? {
        get {
            return loadEvidence(with: UIViewController.transitionAnimationsReference) as? UIViewAnimations
        }
        set {
            let reference = UIViewController.transitionAnimationsReference
            guard let animations = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animations, with: reference)
        }
    }


    /// Provides the completion handler passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionCompletion: UIViewAnimationsCompletion? {
        get {
            return loadEvidence(with: UIViewController.transitionCompletionReference) as? UIViewAnimationsCompletion
        }
        set {
            let reference = UIViewController.transitionCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
