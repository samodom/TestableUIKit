//
//  UIPageViewControllerSetViewControllersSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIPageViewController {

    private static let setViewControllersCalledString = UUIDKeyString()
    private static let setViewControllersCalledKey = ObjectAssociationKey(setViewControllersCalledString)
    private static let setViewControllersCalledReference = SpyEvidenceReference(key: setViewControllersCalledKey)

    private static let setViewControllersControllersString = UUIDKeyString()
    private static let setViewControllersControllersKey = ObjectAssociationKey(setViewControllersControllersString)
    private static let setViewControllersControllersReference = SpyEvidenceReference(key: setViewControllersControllersKey)

    private static let setViewControllersDirectionString = UUIDKeyString()
    private static let setViewControllersDirectionKey = ObjectAssociationKey(setViewControllersDirectionString)
    private static let setViewControllersDirectionReference = SpyEvidenceReference(key: setViewControllersDirectionKey)

    private static let setViewControllersAnimatedString = UUIDKeyString()
    private static let setViewControllersAnimatedKey = ObjectAssociationKey(setViewControllersAnimatedString)
    private static let setViewControllersAnimatedReference = SpyEvidenceReference(key: setViewControllersAnimatedKey)

    private static let setViewControllersCompletionString = UUIDKeyString()
    private static let setViewControllersCompletionKey = ObjectAssociationKey(setViewControllersCompletionString)
    private static let setViewControllersCompletionReference = SpyEvidenceReference(key: setViewControllersCompletionKey)


    /// Spy controller for ensuring a page view controller has had its implementation of
    /// `setViewControllers(_:direction:animated:completion:)` invoked.
    public enum SetViewControllersSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIPageViewController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIPageViewController.setViewControllers(_:direction:animated:completion:)),
                spy: #selector(UIPageViewController.spy_setViewControllers(_:direction:animated:completion:))
            )
        ] as Set
        public static let evidence = [
            setViewControllersCalledReference,
            setViewControllersControllersReference,
            setViewControllersDirectionReference,
            setViewControllersAnimatedReference,
            setViewControllersCompletionReference
        ] as Set
        public static var forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setViewControllers(_:direction:animated:completion:)`
    public func spy_setViewControllers(
        _ controllers: [UIViewController]?,
        direction: UIPageViewControllerNavigationDirection,
        animated: Bool,
        completion: UIViewAnimationsCompletion? = nil
        ) {

        setViewControllersCalled = true
        setViewControllersControllers = controllers
        setViewControllersDirection = direction
        setViewControllersAnimated = animated

        if UIPageViewController.SetViewControllersSpyController.forwardsInvocations {
            spy_setViewControllers(
                controllers,
                direction: direction,
                animated: animated,
                completion: completion
            )
        }
        else {
            setViewControllersCompletion = completion
        }
    }


    /// Indicates whether the `setViewControllers(_:direction:animated:completion:)` method
    /// has been called on this object.
    public final var setViewControllersCalled: Bool {
        get {
            return loadEvidence(with: UIPageViewController.setViewControllersCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIPageViewController.setViewControllersCalledReference)
        }
    }


    /// Provides the view controllers passed to
    /// `setViewControllers(_:direction:animated:completion:)` if called.
    public final var setViewControllersControllers: [UIViewController]? {
        get {
            return loadEvidence(with: UIPageViewController.setViewControllersControllersReference) as? [UIViewController]
        }
        set {
            let reference = UIPageViewController.setViewControllersControllersReference
            guard let controllers = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controllers, with: reference)
        }
    }


    /// Provides the direction passed to `setViewControllers(_:direction:animated:completion:)`
    /// if called.
    public final var setViewControllersDirection: UIPageViewControllerNavigationDirection? {
        get {
            return loadEvidence(with: UIPageViewController.setViewControllersDirectionReference) as? UIPageViewControllerNavigationDirection
        }
        set {
            let reference = UIPageViewController.setViewControllersDirectionReference
            guard let direction = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(direction, with: reference)
        }
    }


    /// Provides the animation flag passed to `setViewControllers(_:direction:animated:completion:)`
    /// if called.
    public final var setViewControllersAnimated: Bool? {
        get {
            return loadEvidence(with: UIPageViewController.setViewControllersAnimatedReference) as? Bool
        }
        set {
            let reference = UIPageViewController.setViewControllersAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }


    /// Provides the completion handler passed to `setViewControllers(_:direction:animated:completion:)` if called.
    public final var setViewControllersCompletion: UIViewAnimationsCompletion? {
        get {
            return loadEvidence(with: UIPageViewController.setViewControllersCompletionReference) as? UIViewAnimationsCompletion
        }
        set {
            let reference = UIPageViewController.setViewControllersCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
