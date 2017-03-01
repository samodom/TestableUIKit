//
//  UITableViewDeleteRowsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

    private static let deleteRowsCalledKeyString = UUIDKeyString()
    private static let deleteRowsCalledKey =
        ObjectAssociationKey(deleteRowsCalledKeyString)
    private static let deleteRowsCalledReference =
        SpyEvidenceReference(key: deleteRowsCalledKey)

    private static let deleteRowsIndexPathsKeyString = UUIDKeyString()
    private static let deleteRowsIndexPathsKey =
        ObjectAssociationKey(deleteRowsIndexPathsKeyString)
    private static let deleteRowsIndexPathsReference =
        SpyEvidenceReference(key: deleteRowsIndexPathsKey)

    private static let deleteRowsAnimationKeyString = UUIDKeyString()
    private static let deleteRowsAnimationKey =
        ObjectAssociationKey(deleteRowsAnimationKeyString)
    private static let deleteRowsAnimationReference =
        SpyEvidenceReference(key: deleteRowsAnimationKey)

    private static let deleteRowsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.deleteRows(at:with:)),
        spy: #selector(UITableView.spy_deleteRows(at:with:))
    )


    /// Spy controller for ensuring that a table view has had `deleteRows(at:with:)` called on it.
    public enum DeleteRowsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [deleteRowsCoselectors]
        public static let evidence: Set = [
            deleteRowsCalledReference,
            deleteRowsIndexPathsReference,
            deleteRowsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `deleteRows(at:with:)`
    dynamic public func spy_deleteRows(
        at indexPaths: [IndexPath],
        with animation: UITableViewRowAnimation
        ) {

        deleteRowsCalled = true
        deleteRowsIndexPaths = indexPaths
        deleteRowsAnimation = animation

        spy_deleteRows(at: indexPaths, with: animation)
    }


    /// Indicates whether the `deleteRows(at:with:)` method has been called on this object.
    public final var deleteRowsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.deleteRowsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.deleteRowsCalledReference)
        }
    }


    /// Provides the index paths passed to `deleteRows(at:with:)` if called.
    public final var deleteRowsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UITableView.deleteRowsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UITableView.deleteRowsIndexPathsReference
            guard let rows = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(rows, with: reference)
        }
    }


    /// Provides the animation type passed to `deleteRows(at:with:)` if called.
    public final var deleteRowsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.deleteRowsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.deleteRowsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
