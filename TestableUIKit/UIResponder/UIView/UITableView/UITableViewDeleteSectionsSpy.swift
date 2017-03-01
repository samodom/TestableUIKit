//
//  UITableViewDeleteSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

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

    private static let deleteSectionsAnimationKeyString = UUIDKeyString()
    private static let deleteSectionsAnimationKey =
        ObjectAssociationKey(deleteSectionsAnimationKeyString)
    private static let deleteSectionsAnimationReference =
        SpyEvidenceReference(key: deleteSectionsAnimationKey)

    private static let deleteSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.deleteSections(_:with:)),
        spy: #selector(UITableView.spy_deleteSections(_:with:))
    )


    /// Spy controller for ensuring that a table view has had `deleteSections(_:with:)` called on it.
    public enum DeleteSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [deleteSectionsCoselectors]
        public static let evidence: Set = [
            deleteSectionsCalledReference,
            deleteSectionsSectionsReference,
            deleteSectionsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `deleteSections(_:with:)`
    dynamic public func spy_deleteSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        deleteSectionsCalled = true
        deleteSectionsSections = sections
        deleteSectionsAnimation = animation

        spy_deleteSections(sections, with: animation)
    }


    /// Indicates whether the `deleteSections(_:with:)` method has been called on this object.
    public final var deleteSectionsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.deleteSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.deleteSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `deleteSections(_:with:)` if called.
    public final var deleteSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UITableView.deleteSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UITableView.deleteSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }


    /// Provides the animation type passed to `deleteSections(_:with:)` if called.
    public final var deleteSectionsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.deleteSectionsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.deleteSectionsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
