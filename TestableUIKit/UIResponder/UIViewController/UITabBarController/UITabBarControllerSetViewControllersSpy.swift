//
//  UITabBarControllerSetViewControllersSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UITabBarController {

    private static let setViewControllersCalledString = UUIDKeyString()
    private static let setViewControllersCalledKey = ObjectAssociationKey(setViewControllersCalledString)
    private static let setViewControllersCalledReference = SpyEvidenceReference(key: setViewControllersCalledKey)

    private static let setViewControllersControllersString = UUIDKeyString()
    private static let setViewControllersControllersKey = ObjectAssociationKey(setViewControllersControllersString)
    private static let setViewControllersControllersReference = SpyEvidenceReference(key: setViewControllersControllersKey)

    private static let setViewControllersAnimatedString = UUIDKeyString()
    private static let setViewControllersAnimatedKey = ObjectAssociationKey(setViewControllersAnimatedString)
    private static let setViewControllersAnimatedReference = SpyEvidenceReference(key: setViewControllersAnimatedKey)


    /// Spy controller for ensuring a tab bar controller has had its implementation of
    /// `setViewControllers(_:animated:)` invoked.
    public enum SetViewControllersSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITabBarController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UITabBarController.setViewControllers(_:animated:)),
                spy: #selector(UITabBarController.spy_setViewControllers(_:animated:))
            )
        ] as Set
        public static let evidence = [
            setViewControllersCalledReference,
            setViewControllersControllersReference,
            setViewControllersAnimatedReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of
    /// `setViewControllers(_:direction:animated:completion:)`
    public func spy_setViewControllers(_ controllers: [UIViewController]?, animated: Bool) {
        setViewControllersCalled = true
        setViewControllersControllers = controllers
        setViewControllersAnimated = animated

        spy_setViewControllers(controllers, animated: animated)
    }


    /// Indicates whether the `setViewControllers(_:animated:)` method has been called
    /// on this object.
    public final var setViewControllersCalled: Bool {
        get {
            return loadEvidence(with: UITabBarController.setViewControllersCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITabBarController.setViewControllersCalledReference)
        }
    }


    /// Provides the view controllers passed to
    /// `setViewControllers(_:animated:)` if called.
    public final var setViewControllersControllers: [UIViewController]? {
        get {
            return loadEvidence(with: UITabBarController.setViewControllersControllersReference) as? [UIViewController]
        }
        set {
            let reference = UITabBarController.setViewControllersControllersReference
            guard let controllers = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controllers, with: reference)
        }
    }


    /// Provides the animation flag passed to `setViewControllers(_:animated:)`
    /// if called.
    public final var setViewControllersAnimated: Bool? {
        get {
            return loadEvidence(with: UITabBarController.setViewControllersAnimatedReference) as? Bool
        }
        set {
            let reference = UITabBarController.setViewControllersAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }

}
