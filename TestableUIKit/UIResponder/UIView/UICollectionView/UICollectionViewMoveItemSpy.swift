//
//  UICollectionViewMoveItemSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let moveItemCalledKeyString = UUIDKeyString()
    private static let moveItemCalledKey =
        ObjectAssociationKey(moveItemCalledKeyString)
    private static let moveItemCalledReference =
        SpyEvidenceReference(key: moveItemCalledKey)

    private static let moveItemFromItemKeyString = UUIDKeyString()
    private static let moveItemFromItemKey =
        ObjectAssociationKey(moveItemFromItemKeyString)
    private static let moveItemFromItemReference =
        SpyEvidenceReference(key: moveItemFromItemKey)

    private static let moveItemToItemKeyString = UUIDKeyString()
    private static let moveItemToItemKey =
        ObjectAssociationKey(moveItemToItemKeyString)
    private static let moveItemToItemReference =
        SpyEvidenceReference(key: moveItemToItemKey)

    private static let moveItemCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.moveItem(at:to:)),
        spy: #selector(UICollectionView.spy_moveItem(at:to:))
    )


    /// Spy controller for ensuring that a collection view has had `moveItem(at:to:)` called on it.
    public enum MoveItemSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [moveItemCoselectors]
        public static let evidence: Set = [
            moveItemCalledReference,
            moveItemFromItemReference,
            moveItemToItemReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `moveItem(at:to:)`
    dynamic public func spy_moveItem(at fromItem: IndexPath, to toItem: IndexPath) {
        moveItemCalled = true
        moveItemFromItem = fromItem
        moveItemToItem = toItem

        spy_moveItem(at: fromItem, to: toItem)
    }


    /// Indicates whether the `moveItem(at:to:)` method has been called on this object.
    public final var moveItemCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.moveItemCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.moveItemCalledReference)
        }
    }


    /// Provides the source item passed to `moveItem(at:to:)` if called.
    public final var moveItemFromItem: IndexPath? {
        get {
            return loadEvidence(with: UICollectionView.moveItemFromItemReference) as? IndexPath
        }
        set {
            let reference = UICollectionView.moveItemFromItemReference
            guard let item = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(item, with: reference)
        }
    }


    /// Provides the destination item passed to `moveItem(at:to:)` if called.
    public final var moveItemToItem: IndexPath? {
        get {
            return loadEvidence(with: UICollectionView.moveItemToItemReference) as? IndexPath
        }
        set {
            let reference = UICollectionView.moveItemToItemReference
            guard let item = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(item, with: reference)
        }
    }
    
}
