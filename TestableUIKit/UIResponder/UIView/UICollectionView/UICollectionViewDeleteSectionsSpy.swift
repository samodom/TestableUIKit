//
//  UICollectionViewDeleteSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let deleteSectionsCalledKeyString = UUIDKeyString()
    private static let deleteSectionsCalledKey =
        ObjectAssociationKey(deleteSectionsCalledKeyString)
    private static let deleteSectionsCalledReference =
        SpyEvidenceReference(key: deleteSectionsCalledKey)

    private static let deleteSectionsSectionsKeyString = UUIDKeyString()
    private static let deleteSectionsSectionsKey =
        ObjectAssociationKey(deleteSectionsSectionsKeyString)
    private static let deleteSectionsSectionsReference =
        SpyEvidenceReference(key: deleteSectionsSectionsKey)

    private static let deleteSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.deleteSections(_:)),
        spy: #selector(UICollectionView.spy_deleteSections(_:))
    )


    /// Spy controller for ensuring that a table view has had `deleteSections(_:)` called on it.
    public enum DeleteSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [deleteSectionsCoselectors]
        public static let evidence: Set = [
            deleteSectionsCalledReference,
            deleteSectionsSectionsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `deleteSections(_:)`
    dynamic public func spy_deleteSections(_ sections: IndexSet) {
        deleteSectionsCalled = true
        deleteSectionsSections = sections

        spy_deleteSections(sections)
    }


    /// Indicates whether the `deleteSections(_:)` method has been called on this object.
    public final var deleteSectionsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.deleteSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.deleteSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `deleteSections(_:)` if called.
    public final var deleteSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UICollectionView.deleteSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UICollectionView.deleteSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }
    
}
