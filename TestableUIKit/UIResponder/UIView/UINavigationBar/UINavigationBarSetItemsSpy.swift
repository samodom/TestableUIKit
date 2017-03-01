//
//  UINavigationBarSetItemsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UINavigationBar {

    private static let setItemsCalledKeyString = UUIDKeyString()
    private static let setItemsCalledKey =
        ObjectAssociationKey(setItemsCalledKeyString)
    private static let setItemsCalledReference =
        SpyEvidenceReference(key: setItemsCalledKey)

    private static let setItemsItemsKeyString = UUIDKeyString()
    private static let setItemsItemsKey =
        ObjectAssociationKey(setItemsItemsKeyString)
    private static let setItemsItemsReference =
        SpyEvidenceReference(key: setItemsItemsKey)

    private static let setItemsAnimatedKeyString = UUIDKeyString()
    private static let setItemsAnimatedKey =
        ObjectAssociationKey(setItemsAnimatedKeyString)
    private static let setItemsAnimatedReference =
        SpyEvidenceReference(key: setItemsAnimatedKey)

    private static let setItemsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UINavigationBar.setItems(_:animated:)),
        spy: #selector(UINavigationBar.spy_setItems(_:animated:))
    )


    /// Spy controller for ensuring that a navigation bar has had `setItems(_:animated:)` called on it.
    public enum SetItemsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UINavigationBar.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [setItemsCoselectors]
        public static let evidence: Set = [
            setItemsCalledReference,
            setItemsItemsReference,
            setItemsAnimatedReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setItems(_:animated)`
    dynamic public func spy_setItems(_ items: [UINavigationItem]?, animated: Bool) {
        setItemsCalled = true
        setItemsItems = items
        setItemsAnimated = animated

        spy_setItems(items, animated: animated)
    }


    /// Indicates whether the `setItems(_:animated:)` method has been called on this object.
    public final var setItemsCalled: Bool {
        get {
            return loadEvidence(with: UINavigationBar.setItemsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UINavigationBar.setItemsCalledReference)
        }
    }


    /// Provides the items passed to `setItems(_:animated:)` if called.
    public final var setItemsItems: [UINavigationItem]? {
        get {
            return loadEvidence(with: UINavigationBar.setItemsItemsReference) as? [UINavigationItem]
        }
        set {
            let reference = UINavigationBar.setItemsItemsReference
            guard let items = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(items, with: reference)
        }
    }


    /// Provides the animation flag passed to `setItems(_:animated:)` if called.
    public final var setItemsAnimated: Bool? {
        get {
            return loadEvidence(with: UINavigationBar.setItemsAnimatedReference) as? Bool
        }
        set {
            let reference = UINavigationBar.setItemsAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }

}
