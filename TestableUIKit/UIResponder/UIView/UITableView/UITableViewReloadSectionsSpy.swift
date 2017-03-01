//
//  UITableViewReloadSectionsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

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

    private static let reloadSectionsAnimationKeyString = UUIDKeyString()
    private static let reloadSectionsAnimationKey =
        ObjectAssociationKey(reloadSectionsAnimationKeyString)
    private static let reloadSectionsAnimationReference =
        SpyEvidenceReference(key: reloadSectionsAnimationKey)

    private static let reloadSectionsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.reloadSections(_:with:)),
        spy: #selector(UITableView.spy_reloadSections(_:with:))
    )


    /// Spy controller for ensuring that a table view has had `reloadSections(_:with:)` called on it.
    public enum ReloadSectionsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [reloadSectionsCoselectors]
        public static let evidence: Set = [
            reloadSectionsCalledReference,
            reloadSectionsSectionsReference,
            reloadSectionsAnimationReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadSections(_:with:)`
    dynamic public func spy_reloadSections(_ sections: IndexSet, with animation: UITableViewRowAnimation) {
        reloadSectionsCalled = true
        reloadSectionsSections = sections
        reloadSectionsAnimation = animation

        spy_reloadSections(sections, with: animation)
    }


    /// Indicates whether the `reloadSections(_:with:)` method has been called on this object.
    public final var reloadSectionsCalled: Bool {
        get {
            return loadEvidence(with: UITableView.reloadSectionsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.reloadSectionsCalledReference)
        }
    }


    /// Provides the sections passed to `reloadSections(_:with:)` if called.
    public final var reloadSectionsSections: IndexSet? {
        get {
            return loadEvidence(with: UITableView.reloadSectionsSectionsReference) as? IndexSet
        }
        set {
            let reference = UITableView.reloadSectionsSectionsReference
            guard let sections = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sections, with: reference)
        }
    }


    /// Provides the animation type passed to `reloadSections(_:with:)` if called.
    public final var reloadSectionsAnimation: UITableViewRowAnimation? {
        get {
            return loadEvidence(with: UITableView.reloadSectionsAnimationReference) as? UITableViewRowAnimation
        }
        set {
            let reference = UITableView.reloadSectionsAnimationReference
            guard let animation = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(animation, with: reference)
        }
    }
    
}
