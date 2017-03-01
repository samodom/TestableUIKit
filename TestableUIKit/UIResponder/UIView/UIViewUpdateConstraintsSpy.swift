//
//  UIViewUpdateConstraintsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/10/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let updateConstraintsCalledKeyString = UUIDKeyString()
    private static let updateConstraintsCalledKey =
        ObjectAssociationKey(updateConstraintsCalledKeyString)
    private static let updateConstraintsCalledReference =
        SpyEvidenceReference(key: updateConstraintsCalledKey)

    private static let updateConstraintsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.updateConstraints),
        spy: #selector(UIView.spy_updateConstraints)
    )


    /// Spy controller for ensuring that a subclass calls its superclass implementation
    /// of `updateConstraints` when the same method is invoked on it.
    public enum UpdateConstraintsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.indirect
        public static let coselectors: Set = [updateConstraintsCoselectors]
        public static let evidence: Set = [updateConstraintsCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `updateConstraints`
    dynamic public func spy_updateConstraints() {
        superclassUpdateConstraintsCalled = true
        spy_updateConstraints()
    }


    /// Indicates whether the `updateConstraints` method has been called on this object's superclass.
    public final var superclassUpdateConstraintsCalled: Bool {
        get {
            return loadEvidence(with: UIView.updateConstraintsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.updateConstraintsCalledReference)
        }
    }

}
