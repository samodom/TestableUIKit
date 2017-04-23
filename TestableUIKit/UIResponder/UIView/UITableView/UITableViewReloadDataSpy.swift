//
//  UITableViewReloadDataSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger
import TestSwagger


public extension UITableView {

    private static let reloadDataCalledString = UUIDKeyString()
    private static let reloadDataCalledKey = ObjectAssociationKey(reloadDataCalledString)
    private static let reloadDataCalledReference = SpyEvidenceReference(key: reloadDataCalledKey)


    /// Spy controller for ensuring a table view has had `reloadData` called on it.
    public enum ReloadDataSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UITableView.reloadData),
                spy: #selector(UITableView.spy_reloadData)
            )
        ] as Set
        public static let evidence = [reloadDataCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reloadData`
    public func spy_reloadData() {
        reloadDataCalled = true
        spy_reloadData()
    }


    /// Indicates whether the `reloadData` method has been called on this object.
    public final var reloadDataCalled: Bool {
        get {
            return loadEvidence(with: UITableView.reloadDataCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UITableView.reloadDataCalledReference)
        }
    }
    
}
