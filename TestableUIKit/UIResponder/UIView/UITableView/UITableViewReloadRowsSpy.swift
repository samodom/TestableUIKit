//
//  UITableViewReloadRowsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

    private static let reloadRowsCalledKeyString = UUIDKeyString()
    private static let reloadRowsCalledKey =
        ObjectAssociationKey(reloadRowsCalledKeyString)
    private static let reloadRowsCalledReference =
        SpyEvidenceReference(key: reloadRowsCalledKey)

    private static let reloadRowsIndexPathsKeyString = UUIDKeyString()
    private static let reloadRowsIndexPathsKey =
        ObjectAssociationKey(reloadRowsIndexPathsKeyString)
    private static let reloadRowsIndexPathsReference =
        SpyEvidenceReference(key: reloadRowsIndexPathsKey)

    private static let reloadRowsAnimationKeyString = UUIDKeyString()
    private static let reloadRowsAnimationKey =
        ObjectAssociationKey(reloadRowsAnimationKeyString)
    private static let reloadRowsAnimationReference =
        SpyEvidenceReference(key: reloadRowsAnimationKey)

    private static let reloadRowsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.reloadRows(at:with:)),
        spy: #selector(UITableView.spy_reloadRows(at:with:))
    )


    /// Spy controller for ensuring that a table view has had `reloadRows(at:with:)` called on it.
    public enum ReloadRowsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [reloadRowsCoselectors]
        public static let evidence: Set = [
            reloadRowsCalledReference,
            reloadRowsIndexPathsReference,
            reloadRowsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadRows(at:with:)`
    dynamic public func spy_reloadRows(
        at indexPaths: [IndexPath],
        with animation: UITableViewRowAnimation
        ) {

        reloadRowsCalled = true
        reloadRowsIndexPaths = indexPaths
        reloadRowsAnimation = animation

        spy_reloadRows(at: indexPaths, with: animation)
    }


    /// Indicates whether the `reloadRows(at:with:)` method has been called on this object.
    public final var reloadRowsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.reloadRowsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.reloadRowsCalledReference)
        }
    }


    /// Provides the index paths passed to `reloadRows(at:with:)` if called.
    public final var reloadRowsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UITableView.reloadRowsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UITableView.reloadRowsIndexPathsReference
            guard let rows = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(rows, with: reference)
        }
    }


    /// Provides the animation type passed to `reloadRows(at:with:)` if called.
    public final var reloadRowsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.reloadRowsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.reloadRowsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
