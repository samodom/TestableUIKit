//
//  UITableViewReloadSectionIndexTitlesSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger
import TestSwagger


public extension UITableView {

    private static let reloadSectionIndexTitlesCalledString = UUIDKeyString()
    private static let reloadSectionIndexTitlesCalledKey =
        ObjectAssociationKey(reloadSectionIndexTitlesCalledString)
    private static let reloadSectionIndexTitlesCalledReference =
        SpyEvidenceReference(key: reloadSectionIndexTitlesCalledKey)


    /// Spy controller for ensuring a table view has had `reloadSectionIndexTitles` called on it.
    public enum ReloadSectionIndexTitlesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UITableView.reloadSectionIndexTitles),
                spy: #selector(UITableView.spy_reloadSectionIndexTitles)
            )
        ] as Set
        public static let evidence = [reloadSectionIndexTitlesCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadSectionIndexTitles`
    public func spy_reloadSectionIndexTitles() {
        reloadSectionIndexTitlesCalled = true
        spy_reloadSectionIndexTitles()
    }


    /// Indicates whether the `reloadSectionIndexTitles` method has been called on this object.
    public final var reloadSectionIndexTitlesCalled: Bool {
        get {
            return loadEvidence(with: UITableView.reloadSectionIndexTitlesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UITableView.reloadSectionIndexTitlesCalledReference)
        }
    }
    
}
