//
//  UITableViewInsertSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

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

    private static let insertSectionsAnimationKeyString = UUIDKeyString()
    private static let insertSectionsAnimationKey =
        ObjectAssociationKey(insertSectionsAnimationKeyString)
    private static let insertSectionsAnimationReference =
        SpyEvidenceReference(key: insertSectionsAnimationKey)

    private static let insertSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.insertSections(_:with:)),
        spy: #selector(UITableView.spy_insertSections(_:with:))
    )


    /// Spy controller for ensuring that a table view has had `insertSections(_:with:)` called on it.
    public enum InsertSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [insertSectionsCoselectors]
        public static let evidence: Set = [
            insertSectionsCalledReference,
            insertSectionsSectionsReference,
            insertSectionsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `insertSections(_:with:)`
    dynamic public func spy_insertSections(
        _ sections: IndexSet,
        with animation: UITableViewRowAnimation
        ) {

        insertSectionsCalled = true
        insertSectionsSections = sections
        insertSectionsAnimation = animation

        spy_insertSections(sections, with: animation)
    }


    /// Indicates whether the `insertSections(_:with:)` method has been called on this object.
    public final var insertSectionsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.insertSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.insertSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `insertSections(_:with:)` if called.
    public final var insertSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UITableView.insertSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UITableView.insertSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }


    /// Provides the animation type passed to `insertSections(_:with:)` if called.
    public final var insertSectionsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.insertSectionsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.insertSectionsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
