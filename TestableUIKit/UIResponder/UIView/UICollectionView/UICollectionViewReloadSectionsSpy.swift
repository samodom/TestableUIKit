//
//  UICollectionViewReloadSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UICollectionView {

    private static let reloadSectionsCalledKeyString = UUIDKeyString()
    private static let reloadSectionsCalledKey =
        ObjectAssociationKey(reloadSectionsCalledKeyString)
    private static let reloadSectionsCalledReference =
        SpyEvidenceReference(key: reloadSectionsCalledKey)

    private static let reloadSectionsSectionsKeyString = UUIDKeyString()
    private static let reloadSectionsSectionsKey =
        ObjectAssociationKey(reloadSectionsSectionsKeyString)
    private static let reloadSectionsSectionsReference =
        SpyEvidenceReference(key: reloadSectionsSectionsKey)

    private static let reloadSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UICollectionView.reloadSections(_:)),
        spy: #selector(UICollectionView.spy_reloadSections(_:))
    )


    /// Spy controller for ensuring that a table view has had `reloadSections(_:)` called on it.
    public enum ReloadSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UICollectionView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [reloadSectionsCoselectors]
        public static let evidence: Set = [
            reloadSectionsCalledReference,
            reloadSectionsSectionsReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadSections(_:)`
    dynamic public func spy_reloadSections(_ sections: IndexSet) {
        reloadSectionsCalled = true
        reloadSectionsSections = sections

        spy_reloadSections(sections)
    }


    /// Indicates whether the `reloadSections(_:)` method has been called on this object.
    public final var reloadSectionsCalled: Bool {
        get {
            return loadEvidence(with: UICollectionView.reloadSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UICollectionView.reloadSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `reloadSections(_:)` if called.
    public final var reloadSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UICollectionView.reloadSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UICollectionView.reloadSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }
    
}
