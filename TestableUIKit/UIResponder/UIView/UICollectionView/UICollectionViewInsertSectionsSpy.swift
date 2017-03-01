//
//  UICollectionViewInsertSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let insertSectionsCalledKeyString = UUIDKeyString()
    private static let insertSectionsCalledKey =
        ObjectAssociationKey(insertSectionsCalledKeyString)
    private static let insertSectionsCalledReference =
        SpyEvidenceReference(key: insertSectionsCalledKey)

    private static let insertSectionsSectionsKeyString = UUIDKeyString()
    private static let insertSectionsSectionsKey =
        ObjectAssociationKey(insertSectionsSectionsKeyString)
    private static let insertSectionsSectionsReference =
        SpyEvidenceReference(key: insertSectionsSectionsKey)

    private static let insertSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.insertSections(_:)),
        spy: #selector(UICollectionView.spy_insertSections(_:))
    )


    /// Spy controller for ensuring that a table view has had `insertSections(_:)` called on it.
    public enum InsertSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [insertSectionsCoselectors]
        public static let evidence: Set = [
            insertSectionsCalledReference,
            insertSectionsSectionsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `insertSections(_:)`
    dynamic public func spy_insertSections(_ sections: IndexSet) {
        insertSectionsCalled = true
        insertSectionsSections = sections

        spy_insertSections(sections)
    }


    /// Indicates whether the `insertSections(_:)` method has been called on this object.
    public final var insertSectionsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.insertSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.insertSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `insertSections(_:)` if called.
    public final var insertSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UICollectionView.insertSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UICollectionView.insertSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }
    
}
