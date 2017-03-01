//
//  UITableViewMoveRowSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UITableView {

    private static let moveRowCalledKeyString = UUIDKeyString()
    private static let moveRowCalledKey =
        ObjectAssociationKey(moveRowCalledKeyString)
    private static let moveRowCalledReference =
        SpyEvidenceReference(key: moveRowCalledKey)

    private static let moveRowFromRowKeyString = UUIDKeyString()
    private static let moveRowFromRowKey =
        ObjectAssociationKey(moveRowFromRowKeyString)
    private static let moveRowFromRowReference =
        SpyEvidenceReference(key: moveRowFromRowKey)

    private static let moveRowToRowKeyString = UUIDKeyString()
    private static let moveRowToRowKey =
        ObjectAssociationKey(moveRowToRowKeyString)
    private static let moveRowToRowReference =
        SpyEvidenceReference(key: moveRowToRowKey)

    private static let moveRowCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UITableView.moveRow(at:to:)),
        spy: #selector(UITableView.spy_moveRow(at:to:))
    )


    /// Spy controller for ensuring that a table view has had `moveRow(at:to:)` called on it.
    public enum MoveRowSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UITableView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [moveRowCoselectors]
        public static let evidence: Set = [
            moveRowCalledReference,
            moveRowFromRowReference,
            moveRowToRowReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `moveRow(at:to:)`
    dynamic public func spy_moveRow(at fromRow: IndexPath, to toRow: IndexPath) {
        moveRowCalled = true
        moveRowFromRow = fromRow
        moveRowToRow = toRow

        spy_moveRow(at: fromRow, to: toRow)
    }


    /// Indicates whether the `moveRow(at:to:)` method has been called on this object.
    public final var moveRowCalled: Bool {
        get {
            return loadEvidence(with: UITableView.moveRowCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UITableView.moveRowCalledReference)
        }
    }


    /// Provides the source row passed to `moveRow(at:to:)` if called.
    public final var moveRowFromRow: IndexPath? {
        get {
            return loadEvidence(with: UITableView.moveRowFromRowReference) as? IndexPath
        }
        set {
            let reference = UITableView.moveRowFromRowReference
            guard let row = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(row, with: reference)
        }
    }


    /// Provides the destination row passed to `moveRow(at:to:)` if called.
    public final var moveRowToRow: IndexPath? {
        get {
            return loadEvidence(with: UITableView.moveRowToRowReference) as? IndexPath
        }
        set {
            let reference = UITableView.moveRowToRowReference
            guard let row = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(row, with: reference)
        }
    }
    
}
