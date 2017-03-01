//
//  UINavigationControllerPopViewControllerSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UINavigationController {

    private static let popCalledString = UUIDKeyString()
    private static let popCalledKey = ObjectAssociationKey(popCalledString)
    private static let popCalledReference = SpyEvidenceReference(key: popCalledKey)

    private static let poppedControllerString = UUIDKeyString()
    private static let poppedControllerKey = ObjectAssociationKey(poppedControllerString)
    private static let poppedControllerReference = SpyEvidenceReference(key: poppedControllerKey)

    private static let popAnimatedString = UUIDKeyString()
    private static let popAnimatedKey = ObjectAssociationKey(popAnimatedString)
    private static let popAnimatedReference = SpyEvidenceReference(key: popAnimatedKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `popViewController(animated:)`, `popToViewController(_:animated:)` or
    /// `popToRootViewController(animated:)` invoked.
    public enum PopSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UINavigationController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UINavigationController.popViewController(animated:)),
                spy: #selector(UINavigationController.spy_popViewController(animated:))
            ),
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UINavigationController.popToViewController(_:animated:)),
                spy: #selector(UINavigationController.spy_popToViewController(_:animated:))
            ),
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UINavigationController.popToRootViewController(animated:)),
                spy: #selector(UINavigationController.spy_popToRootViewController(animated:))
            )
        ] as Set
        public static let evidence = [
            popCalledReference,
            poppedControllerReference,
            popAnimatedReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `popViewController(animated:)`
    public func spy_popViewController(animated: Bool) -> UIViewController? {
        popCalled = true
        popAnimated = animated

        return spy_popViewController(animated: animated)
    }


    /// Spy method that replaces the true implementation of `popToViewController(_:animated:)`
    public func spy_popToViewController(
        _ controller: UIViewController,
        animated: Bool
        ) -> [UIViewController]? {

        popCalled = true
        poppedController = controller
        popAnimated = animated

        return spy_popToViewController(controller, animated: animated)
    }
    

    /// Spy method that replaces the true implementation of `popToRootViewController(animated:)`
    public func spy_popToRootViewController(animated: Bool) -> [UIViewController]? {
        popCalled = true
        popAnimated = animated

        return spy_popToRootViewController(animated: animated)
    }
    

    /// Indicates whether the `popViewController(animated:)`, `popToViewController(_:animated:)`
    /// or `popToRootViewController(animated:)` method has been called on this object.
    public final var popCalled: Bool {
        get {
            return loadEvidence(with: UINavigationController.popCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UINavigationController.popCalledReference)
        }
    }


    /// Provides the view controller passed to `popToViewController(_:animated:)` if called.
    public final var poppedController: UIViewController? {
        get {
            return loadEvidence(with: UINavigationController.poppedControllerReference) as? UIViewController
        }
        set {
            let reference = UINavigationController.poppedControllerReference
            guard let controller = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controller, with: reference)
        }
    }


    /// Provides the animation flag passed to `popViewController(animated:)`,
    /// `popToViewController(_:animated:)` or `popToRootViewController(animated:)` if called.
    public final var popAnimated: Bool? {
        get {
            return loadEvidence(with: UINavigationController.popAnimatedReference) as? Bool
        }
        set {
            let reference = UINavigationController.popAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }

}
