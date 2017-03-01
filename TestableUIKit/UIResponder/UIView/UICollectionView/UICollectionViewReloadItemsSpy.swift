//
//  UICollectionViewReloadItemsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let reloadItemsCalledKeyString = UUIDKeyString()
    private static let reloadItemsCalledKey =
        ObjectAssociationKey(reloadItemsCalledKeyString)
    private static let reloadItemsCalledReference =
        SpyEvidenceReference(key: reloadItemsCalledKey)

    private static let reloadItemsIndexPathsKeyString = UUIDKeyString()
    private static let reloadItemsIndexPathsKey =
        ObjectAssociationKey(reloadItemsIndexPathsKeyString)
    private static let reloadItemsIndexPathsReference =
        SpyEvidenceReference(key: reloadItemsIndexPathsKey)

    private static let reloadItemsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.reloadItems(at:)),
        spy: #selector(UICollectionView.spy_reloadItems(at:))
    )


    /// Spy controller for ensuring that a collection view has had `reloadItems(at:)` called on it.
    public enum ReloadItemsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [reloadItemsCoselectors]
        public static let evidence: Set = [
            reloadItemsCalledReference,
            reloadItemsIndexPathsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadItems(at:)`
    dynamic public func spy_reloadItems(at indexPaths: [IndexPath]) {
        reloadItemsCalled = true
        reloadItemsIndexPaths = indexPaths

        spy_reloadItems(at: indexPaths)
    }


    /// Indicates whether the `reloadItems(at:)` method has been called on this object.
    public final var reloadItemsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.reloadItemsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.reloadItemsCalledReference)
        }
    }


    /// Provides the index paths passed to `reloadItems(at:)` if called.
    public final var reloadItemsIndexPaths: [IndexPath]? {
        get {
            return loadEvidence(with: UICollectionView.reloadItemsIndexPathsReference) as? [IndexPath]
        }
        set {
            let reference = UICollectionView.reloadItemsIndexPathsReference
            guard let items = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(items, with: reference)
        }
    }

}
