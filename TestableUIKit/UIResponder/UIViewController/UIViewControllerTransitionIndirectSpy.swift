//
//  UIViewControllerTransitionIndirectSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let superclassTransitionCalledString = UUIDKeyString()
    private static let superclassTransitionCalledKey =
        ObjectAssociationKey(superclassTransitionCalledString)
    private static let superclassTransitionCalledReference =
        SpyEvidenceReference(key: superclassTransitionCalledKey)

    private static let superclassTransitionFromControllerString = UUIDKeyString()
    private static let superclassTransitionFromControllerKey =
        ObjectAssociationKey(superclassTransitionFromControllerString)
    private static let superclassTransitionFromControllerReference =
        SpyEvidenceReference(key: superclassTransitionFromControllerKey)

    private static let superclassTransitionToControllerString = UUIDKeyString()
    private static let superclassTransitionToControllerKey =
        ObjectAssociationKey(superclassTransitionToControllerString)
    private static let superclassTransitionToControllerReference =
        SpyEvidenceReference(key: superclassTransitionToControllerKey)

    private static let superclassTransitionDurationString = UUIDKeyString()
    private static let superclassTransitionDurationKey =
        ObjectAssociationKey(superclassTransitionDurationString)
    private static let superclassTransitionDurationReference =
        SpyEvidenceReference(key: superclassTransitionDurationKey)

    private static let superclassTransitionOptionsString = UUIDKeyString()
    private static let superclassTransitionOptionsKey =
        ObjectAssociationKey(superclassTransitionOptionsString)
    private static let superclassTransitionOptionsReference =
        SpyEvidenceReference(key: superclassTransitionOptionsKey)

    private static let superclassTransitionAnimationsString = UUIDKeyString()
    private static let superclassTransitionAnimationsKey =
        ObjectAssociationKey(superclassTransitionAnimationsString)
    private static let superclassTransitionAnimationsReference =
        SpyEvidenceReference(key: superclassTransitionAnimationsKey)

    private static let superclassTransitionCompletionString = UUIDKeyString()
    private static let superclassTransitionCompletionKey =
        ObjectAssociationKey(superclassTransitionCompletionString)
    private static let superclassTransitionCompletionReference =
        SpyEvidenceReference(key: superclassTransitionCompletionKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `transition(from:to:duration:options:animations:completion:)`.
    public enum TransitionIndirectSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.transition(from:to:duration:options:animations:completion:)),
                spy: #selector(UIViewController.indirectspy_transition(from:to:duration:options:animations:completion:))
            )
        ] as Set
        public static let evidence = [
            superclassTransitionCalledReference,
            superclassTransitionFromControllerReference,
            superclassTransitionToControllerReference,
            superclassTransitionDurationReference,
            superclassTransitionOptionsReference,
            superclassTransitionAnimationsReference,
            superclassTransitionCompletionReference
        ] as Set
        public static var forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of 
    /// `transition(from:to:duration:options:animations:completion:)`
    public func indirectspy_transition(
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

        if UIViewController.TransitionIndirectSpyController.forwardsInvocations {
            indirectspy_transition(
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


    /// Indicates whether the `transition(from:to:duration:options:animations:completion:)`
    /// method has been called on this object's superclass.
    public final var superclassTransitionCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.superclassTransitionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.superclassTransitionCalledReference)
        }
    }


    /// Provides the source controller passed to
    /// `transition(from:to:duration:options:animations:completion:)` if called.
    public final var superclassTransitionFromController: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.superclassTransitionFromControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.superclassTransitionFromControllerReference
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
            return loadEvidence(with: UIViewController.superclassTransitionToControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.superclassTransitionToControllerReference
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
            return loadEvidence(with: UIViewController.superclassTransitionDurationReference) as? TimeInterval
        }
        set {
            let reference = UIViewController.superclassTransitionDurationReference
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
            return loadEvidence(with: UIViewController.superclassTransitionOptionsReference) as? UIViewAnimationOptions
        }
        set {
            let reference = UIViewController.superclassTransitionOptionsReference
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
            return loadEvidence(with: UIViewController.superclassTransitionAnimationsReference) as? UIViewAnimations
        }
        set {
            let reference = UIViewController.superclassTransitionAnimationsReference
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
            return loadEvidence(with: UIViewController.superclassTransitionCompletionReference) as? UIViewAnimationsCompletion
        }
        set {
            let reference = UIViewController.superclassTransitionCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
