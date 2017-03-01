//
//  UICollectionViewInsertItemsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let insertItemsCalledKeyString = UUIDKeyString()
    private static let insertItemsCalledKey =
        ObjectAssociationKey(insertItemsCalledKeyString)
    private static let insertItemsCalledReference =
        SpyEvidenceReference(key: insertItemsCalledKey)

    private static let insertItemsIndexPathsKeyString = UUIDKeyString()
    private static let insertItemsIndexPathsKey =
        ObjectAssociationKey(insertItemsIndexPathsKeyString)
    private static let insertItemsIndexPathsReference =
        SpyEvidenceReference(key: insertItemsIndexPathsKey)

    private static let insertItemsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.insertItems(at:)),
        spy: #selector(UICollectionView.spy_insertItems(at:))
    )


    /// Spy controller for ensuring that a collection view has had `insertItems(at:)` called on it.
    public enum InsertItemsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [insertItemsCoselectors]
        public static let evidence: Set = [
            insertItemsCalledReference,
            insertItemsIndexPathsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `insertItems(at:)`
    dynamic public func spy_insertItems(at indexPaths: [IndexPath]) {
        insertItemsCalled = true
        insertItemsIndexPaths = indexPaths

        spy_insertItems(at: indexPaths)
    }


    /// Indicates whether the `insertItems(at:)` method has been called on this object.
    public final var insertItemsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.insertItemsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.insertItemsCalledReference)
        }
    }


    /// Provides the index paths passed to `insertItems(at:)` if called.
    public final var insertItemsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UICollectionView.insertItemsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UICollectionView.insertItemsIndexPathsReference
            guard let items = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(items, with: reference)
        }
    }

}
