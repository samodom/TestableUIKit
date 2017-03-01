//
//  UINavigationControllerPushViewControllerSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UINavigationController {

    private static let pushViewControllerCalledString = UUIDKeyString()
    private static let pushViewControllerCalledKey = ObjectAssociationKey(pushViewControllerCalledString)
    private static let pushViewControllerCalledReference = SpyEvidenceReference(key: pushViewControllerCalledKey)

    private static let pushedControllerString = UUIDKeyString()
    private static let pushedControllerKey = ObjectAssociationKey(pushedControllerString)
    private static let pushedControllerReference = SpyEvidenceReference(key: pushedControllerKey)

    private static let pushViewControllerAnimatedString = UUIDKeyString()
    private static let pushViewControllerAnimatedKey = ObjectAssociationKey(pushViewControllerAnimatedString)
    private static let pushViewControllerAnimatedReference = SpyEvidenceReference(key: pushViewControllerAnimatedKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `pushViewController(_:animated:)` invoked.
    public enum PushViewControllerSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UINavigationController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UINavigationController.pushViewController(_:animated:)),
                spy: #selector(UINavigationController.spy_pushViewController(_:animated:))
            )
        ] as Set
        public static let evidence = [
            pushViewControllerCalledReference,
            pushedControllerReference,
            pushViewControllerAnimatedReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `pushViewController(_:animated:)`
    public func spy_pushViewController(_ controller: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        pushedController = controller
        pushViewControllerAnimated = animated

        spy_pushViewController(controller, animated: animated)
    }


    /// Indicates whether the `pushViewController(_:animated:)` method has been
    /// called on this object.
    public final var pushViewControllerCalled: Bool {
        get {
            return loadEvidence(with: UINavigationController.pushViewControllerCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UINavigationController.pushViewControllerCalledReference)
        }
    }


    /// Provides the view controller passed to `pushViewController(_:animated:)` if called.
    public final var pushedController: UIViewController? {
        get {
            return loadEvidence(with: UINavigationController.pushedControllerReference) as? UIViewController
        }
        set {
            let reference = UINavigationController.pushedControllerReference
            guard let controller = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controller, with: reference)
        }
    }


    /// Provides the animation flag passed to `pushViewController(_:animated:)` if called.
    public final var pushViewControllerAnimated: Bool? {
        get {
            return loadEvidence(with: UINavigationController.pushViewControllerAnimatedReference) as? Bool
        }
        set {
            let reference = UINavigationController.pushViewControllerAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }

}
