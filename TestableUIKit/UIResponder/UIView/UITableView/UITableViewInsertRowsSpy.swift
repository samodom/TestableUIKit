//
//  UITableViewInsertRowsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

    private static let insertRowsCalledKeyString = UUIDKeyString()
    private static let insertRowsCalledKey =
        ObjectAssociationKey(insertRowsCalledKeyString)
    private static let insertRowsCalledReference =
        SpyEvidenceReference(key: insertRowsCalledKey)

    private static let insertRowsIndexPathsKeyString = UUIDKeyString()
    private static let insertRowsIndexPathsKey =
        ObjectAssociationKey(insertRowsIndexPathsKeyString)
    private static let insertRowsIndexPathsReference =
        SpyEvidenceReference(key: insertRowsIndexPathsKey)

    private static let insertRowsAnimationKeyString = UUIDKeyString()
    private static let insertRowsAnimationKey =
        ObjectAssociationKey(insertRowsAnimationKeyString)
    private static let insertRowsAnimationReference =
        SpyEvidenceReference(key: insertRowsAnimationKey)

    private static let insertRowsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.insertRows(at:with:)),
        spy: #selector(UITableView.spy_insertRows(at:with:))
    )


    /// Spy controller for ensuring that a table view has had `insertRows(at:with:)` called on it.
    public enum InsertRowsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [insertRowsCoselectors]
        public static let evidence: Set = [
            insertRowsCalledReference,
            insertRowsIndexPathsReference,
            insertRowsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `insertRows(at:with:)`
    dynamic public func spy_insertRows(
        at indexPaths: [IndexPath],
        with animation: UITableViewRowAnimation
        ) {

        insertRowsCalled = true
        insertRowsIndexPaths = indexPaths
        insertRowsAnimation = animation

        spy_insertRows(at: indexPaths, with: animation)
    }


    /// Indicates whether the `insertRows(at:with:)` method has been called on this object.
    public final var insertRowsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.insertRowsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.insertRowsCalledReference)
        }
    }


    /// Provides the index paths passed to `insertRows(at:with:)` if called.
    public final var insertRowsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UITableView.insertRowsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UITableView.insertRowsIndexPathsReference
            guard let rows = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(rows, with: reference)
        }
    }


    /// Provides the animation type passed to `insertRows(at:with:)` if called.
    public final var insertRowsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.insertRowsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.insertRowsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
