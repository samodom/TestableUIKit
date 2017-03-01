//
//  UIViewControllerUpdateViewConstraintsSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let updateViewConstraintsCalledString = UUIDKeyString()
    private static let updateViewConstraintsCalledKey = ObjectAssociationKey(updateViewConstraintsCalledString)
    private static let updateViewConstraintsCalledReference = SpyEvidenceReference(key: updateViewConstraintsCalledKey)


    /// Spy controller for ensuring a controller has not called its superclass's
    /// implementation of `updateViewConstraints`.
    public enum UpdateViewConstraintsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.updateViewConstraints),
                spy: #selector(UIViewController.spy_updateViewConstraints)
            )
        ] as Set
        public static let evidence = [updateViewConstraintsCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `updateViewConstraints`
    public func spy_updateViewConstraints() {
        superclassUpdateViewConstraintsCalled = true
        spy_updateViewConstraints()
    }


    /// Indicates whether the `updateViewConstraints` method has been called on this object's superclass.
    public final var superclassUpdateViewConstraintsCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.updateViewConstraintsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.updateViewConstraintsCalledReference)
        }
    }

}
