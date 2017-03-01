//
//  UICollectionViewPerformBatchUpdatesSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger
import TestSwagger


public extension UICollectionView {

    private static let performBatchUpdatesCalledString = UUIDKeyString()
    private static let performBatchUpdatesCalledKey =
        ObjectAssociationKey(performBatchUpdatesCalledString)
    private static let performBatchUpdatesCalledReference =
        SpyEvidenceReference(key: performBatchUpdatesCalledKey)

    private static let performBatchUpdatesUpdatesString = UUIDKeyString()
    private static let performBatchUpdatesUpdatesKey =
        ObjectAssociationKey(performBatchUpdatesUpdatesString)
    private static let performBatchUpdatesUpdatesReference =
        SpyEvidenceReference(key: performBatchUpdatesUpdatesKey)

    private static let performBatchUpdatesCompletionString = UUIDKeyString()
    private static let performBatchUpdatesCompletionKey =
        ObjectAssociationKey(performBatchUpdatesCompletionString)
    private static let performBatchUpdatesCompletionReference =
        SpyEvidenceReference(key: performBatchUpdatesCompletionKey)


    /// Spy controller for ensuring a collection view has had `performBatchUpdates(_:completion:)` called on it.
    public enum PerformBatchUpdatesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UICollectionView.performBatchUpdates(_:completion:)),
                spy: #selector(UICollectionView.spy_performBatchUpdates(_:completion:))
            )
        ]
        public static let evidence: Set = [
            performBatchUpdatesCalledReference,
            performBatchUpdatesUpdatesReference,
            performBatchUpdatesCompletionReference
        ]
        public static var forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `performBatchUpdates(_:completion:)`
    public func spy_performBatchUpdates(
        _ updates: NullaryVoidClosure?,
        completion: ((Bool) -> Void)?
        ) {

        performBatchUpdatesCalled = true

        if PerformBatchUpdatesSpyController.forwardsInvocations {
            spy_performBatchUpdates(updates, completion: completion)
        }
        else {
            performBatchUpdatesUpdates = updates
            performBatchUpdatesCompletion = completion
        }
    }


    /// Indicates whether the `performBatchUpdates(_:completion:)` method has been called on this object.
    public final var performBatchUpdatesCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.performBatchUpdatesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UICollectionView.performBatchUpdatesCalledReference)
        }
    }


    /// Provides the updates closure passed to `performBatchUpdates(_:completion:)` if called.
    public final var performBatchUpdatesUpdates: NullaryVoidClosure? {
        get {
            return loadEvidence(with: UICollectionView.performBatchUpdatesUpdatesReference) as? NullaryVoidClosure
        }
        set {
            let reference = UICollectionView.performBatchUpdatesUpdatesReference
            guard let updates = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(updates, with: reference)
        }
    }


    /// Provides the completion handler passed to `performBatchUpdates(_:completion:)` if called.
    public final var performBatchUpdatesCompletion: ((Bool) -> Void)? {
        get {
            return loadEvidence(with: UICollectionView.performBatchUpdatesCompletionReference) as? (Bool) -> Void
        }
        set {
            let reference = UICollectionView.performBatchUpdatesCompletionReference
            guard let completion = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(completion, with: reference)
        }
    }

}
