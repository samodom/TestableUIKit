//
//  UIViewControllerSetEditingSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let setEditingCalledString = UUIDKeyString()
    private static let setEditingCalledKey = ObjectAssociationKey(setEditingCalledString)
    private static let setEditingCalledReference = SpyEvidenceReference(key: setEditingCalledKey)

    private static let setEditingEditingString = UUIDKeyString()
    private static let setEditingEditingKey = ObjectAssociationKey(setEditingEditingString)
    private static let setEditingEditingReference = SpyEvidenceReference(key: setEditingEditingKey)

    private static let setEditingAnimatedString = UUIDKeyString()
    private static let setEditingAnimatedKey = ObjectAssociationKey(setEditingAnimatedString)
    private static let setEditingAnimatedReference = SpyEvidenceReference(key: setEditingAnimatedKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `setEditing(_:animated:)`.
    public enum SetEditingSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.setEditing(_:animated:)),
                spy: #selector(UIViewController.spy_setEditing(_:animated:))
            )
        ] as Set
        public static let evidence = [
            setEditingCalledReference,
            setEditingEditingReference,
            setEditingAnimatedReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setEditing(_:animated:)`
    public func spy_setEditing(_ editing: Bool, animated: Bool) {
        superclassSetEditingCalled = true
        superclassSetEditingEditing = editing
        superclassSetEditingAnimated = animated

        spy_setEditing(editing, animated: animated)
    }


    /// Indicates whether the `setEditing(_:animated:)` method has been called on this object's superclass.
    public final var superclassSetEditingCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.setEditingCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.setEditingCalledReference)
        }
    }


    /// Provides the editing flag passed to `setEditing(_:animated:)` if called.
    public final var superclassSetEditingEditing: Bool? {
        get {
            return loadEvidence(with: UIViewController.setEditingEditingReference) as? Bool
        }
        set {
            let reference = UIViewController.setEditingEditingReference
            guard let editing = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(editing, with: reference)
        }
    }


    /// Provides the animation flag passed to `setEditing(_:animated:)` if called.
    public final var superclassSetEditingAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.setEditingAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.setEditingAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }
    
}
