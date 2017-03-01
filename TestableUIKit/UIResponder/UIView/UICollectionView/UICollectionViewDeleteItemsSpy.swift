//
//  UICollectionViewDeleteItemsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let deleteItemsCalledKeyString = UUIDKeyString()
    private static let deleteItemsCalledKey =
        ObjectAssociationKey(deleteItemsCalledKeyString)
    private static let deleteItemsCalledReference =
        SpyEvidenceReference(key: deleteItemsCalledKey)

    private static let deleteItemsIndexPathsKeyString = UUIDKeyString()
    private static let deleteItemsIndexPathsKey =
        ObjectAssociationKey(deleteItemsIndexPathsKeyString)
    private static let deleteItemsIndexPathsReference =
        SpyEvidenceReference(key: deleteItemsIndexPathsKey)

    private static let deleteItemsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.deleteItems(at:)),
        spy: #selector(UICollectionView.spy_deleteItems(at:))
    )


    /// Spy controller for ensuring that a collection view has had `deleteItems(at:)` called on it.
    public enum DeleteItemsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [deleteItemsCoselectors]
        public static let evidence: Set = [
            deleteItemsCalledReference,
            deleteItemsIndexPathsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `deleteItems(at:)`
    dynamic public func spy_deleteItems(at indexPaths: [IndexPath]) {
        deleteItemsCalled = true
        deleteItemsIndexPaths = indexPaths

        spy_deleteItems(at: indexPaths)
    }


    /// Indicates whether the `deleteItems(at:)` method has been called on this object.
    public final var deleteItemsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.deleteItemsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.deleteItemsCalledReference)
        }
    }


    /// Provides the index paths passed to `deleteItems(at:)` if called.
    public final var deleteItemsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UICollectionView.deleteItemsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UICollectionView.deleteItemsIndexPathsReference
            guard let items = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(items, with: reference)
        }
    }

}
