//
//  UINavigationBarPopItemSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UINavigationBar {

    private static let popItemCalledKeyString = UUIDKeyString()
    private static let popItemCalledKey =
        ObjectAssociationKey(popItemCalledKeyString)
    private static let popItemCalledReference =
        SpyEvidenceReference(key: popItemCalledKey)

    private static let popItemAnimatedKeyString = UUIDKeyString()
    private static let popItemAnimatedKey =
        ObjectAssociationKey(popItemAnimatedKeyString)
    private static let popItemAnimatedReference =
        SpyEvidenceReference(key: popItemAnimatedKey)

    private static let popItemCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UINavigationBar.popItem(animated:)),
        spy: #selector(UINavigationBar.spy_popItem(animated:))
    )


    /// Spy controller for ensuring that a navigation bar has had `popItem(animated:)` called on it.
    public enum PopItemSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UINavigationBar.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [popItemCoselectors]
        public static let evidence: Set = [
            popItemCalledReference,
            popItemAnimatedReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `popItem(animated)`
    dynamic public func spy_popItem(animated: Bool) -> UINavigationItem? {
        popItemCalled = true
        popItemAnimated = animated

        return spy_popItem(animated: animated)
    }


    /// Indicates whether the `popItem(animated:)` method has been called on this object.
    public final var popItemCalled: Bool {
        get {
            return loadEvidence(with: UINavigationBar.popItemCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UINavigationBar.popItemCalledReference)
        }
    }


    /// Provides the animation flag passed to `popItem(animated:)` if called.
    public final var popItemAnimated: Bool? {
        get {
            return loadEvidence(with: UINavigationBar.popItemAnimatedReference) as? Bool
        }
        set {
            let reference = UINavigationBar.popItemAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }

}
