//
//  UIViewSetNeedsUpdateConstraintsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let setNeedsUpdateConstraintsCalledKeyString = UUIDKeyString()
    private static let setNeedsUpdateConstraintsCalledKey =
        ObjectAssociationKey(setNeedsUpdateConstraintsCalledKeyString)
    private static let setNeedsUpdateConstraintsCalledReference =
        SpyEvidenceReference(key: setNeedsUpdateConstraintsCalledKey)

    private static let setNeedsUpdateConstraintsCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.setNeedsUpdateConstraints),
        spy: #selector(UIView.spy_setNeedsUpdateConstraints)
    )


    /// Spy controller for ensuring that a view has had `setNeedsUpdateConstraints` called on it.
    public enum SetNeedsUpdateConstraintsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [setNeedsUpdateConstraintsCoselectors]
        public static let evidence: Set = [setNeedsUpdateConstraintsCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setNeedsUpdateConstraints`
    dynamic public func spy_setNeedsUpdateConstraints() {
        setNeedsUpdateConstraintsCalled = true
        spy_setNeedsUpdateConstraints()
    }


    /// Indicates whether the `setNeedsUpdateConstraints` method has been called on this object.
    public final var setNeedsUpdateConstraintsCalled: Bool {
        get {
            return loadEvidence(with: UIView.setNeedsUpdateConstraintsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.setNeedsUpdateConstraintsCalledReference)
        }
    }

}
