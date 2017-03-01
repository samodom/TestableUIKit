//
//  UITableViewBeginUpdatesSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/22/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger
import TestSwagger


public extension UITableView {

    private static let beginUpdatesCalledString = UUIDKeyString()
    private static let beginUpdatesCalledKey =
        ObjectAssociationKey(beginUpdatesCalledString)
    private static let beginUpdatesCalledReference =
        SpyEvidenceReference(key: beginUpdatesCalledKey)


    /// Spy controller for ensuring a table view has had `beginUpdates` called on it.
    public enum BeginUpdatesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UITableView.beginUpdates),
                spy: #selector(UITableView.spy_beginUpdates)
            )
        ] as Set
        public static let evidence = [beginUpdatesCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `beginUpdates`
    public func spy_beginUpdates() {
        beginUpdatesCalled = true
        spy_beginUpdates()
    }


    /// Indicates whether the `beginUpdates` method has been called on this object.
    public final var beginUpdatesCalled: Bool {
        get {
            return loadEvidence(with: UITableView.beginUpdatesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(true, with: UITableView.beginUpdatesCalledReference)
        }
    }
    
}
