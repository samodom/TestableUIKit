//
//  UINavigationBarPushItemSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UINavigationBar {

    private static let pushItemCalledKeyString = UUIDKeyString()
    private static let pushItemCalledKey =
        ObjectAssociationKey(pushItemCalledKeyString)
    private static let pushItemCalledReference =
        SpyEvidenceReference(key: pushItemCalledKey)

    private static let pushItemItemKeyString = UUIDKeyString()
    private static let pushItemItemKey =
        ObjectAssociationKey(pushItemItemKeyString)
    private static let pushItemItemReference =
        SpyEvidenceReference(key: pushItemItemKey)

    private static let pushItemAnimatedKeyString = UUIDKeyString()
    private static let pushItemAnimatedKey =
        ObjectAssociationKey(pushItemAnimatedKeyString)
    private static let pushItemAnimatedReference =
        SpyEvidenceReference(key: pushItemAnimatedKey)

    private static let pushItemCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UINavigationBar.pushItem(_:animated:)),
        spy: #selector(UINavigationBar.spy_pushItem(_:animated:))
    )


    /// Spy controller for ensuring that a navigation bar has had `pushItem(_:animated:)` called on it.
    public enum PushItemSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UINavigationBar.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [pushItemCoselectors]
        public static let evidence: Set = [
            pushItemCalledReference,
            pushItemItemReference,
            pushItemAnimatedReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `pushItem(_:animated)`
    dynamic public func spy_pushItem(_ item: UINavigationItem?, animated: Bool) {
        pushItemCalled = true
        pushItemItem = item
        pushItemAnimated = animated

        spy_pushItem(item, animated: animated)
    }


    /// Indicates whether the `pushItem(_:animated:)` method has been called on this object.
    public final var pushItemCalled: Bool {
        get {
            return loadEvidence(with: UINavigationBar.pushItemCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UINavigationBar.pushItemCalledReference)
        }
    }


    /// Provides the item passed to `pushItem(_:animated:)` if called.
    public final var pushItemItem: UINavigationItem? {
        get {
            return loadEvidence(with: UINavigationBar.pushItemItemReference) as? UINavigationItem
        }
        set {
            let reference = UINavigationBar.pushItemItemReference
            guard let item = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(item, with: reference)
        }
    }


    /// Provides the animation flag passed to `pushItem(_:animated:)` if called.
    public final var pushItemAnimated: Bool? {
        get {
            return loadEvidence(with: UINavigationBar.pushItemAnimatedReference) as? Bool
        }
        set {
            let reference = UINavigationBar.pushItemAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animated, with: reference)
        }
    }
    
}
