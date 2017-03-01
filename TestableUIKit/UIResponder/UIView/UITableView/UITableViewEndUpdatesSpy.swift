//
//  UITableViewEndUpdatesSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger
import TestSwagger


public extension UITableView {

    private static let endUpdatesCalledString = UUIDKeyString()
    private static let endUpdatesCalledKey =
        ObjectAssociationKey(endUpdatesCalledString)
    private static let endUpdatesCalledReference =
        SpyEvidenceReference(key: endUpdatesCalledKey)


    /// Spy controller for ensuring a table view has had `endUpdates` called on it.
    public enum EndUpdatesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UITableView.endUpdates),
                spy: #selector(UITableView.spy_endUpdates)
            )
        ] as Set
        public static let evidence = [endUpdatesCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `endUpdates`
    public func spy_endUpdates() {
        endUpdatesCalled = true
        spy_endUpdates()
    }


    /// Indicates whether the `endUpdates` method has been called on this object.
    public final var endUpdatesCalled: Bool {
        get {
            return loadEvidence(with: UITableView.endUpdatesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UITableView.endUpdatesCalledReference)
        }
    }
    
}
