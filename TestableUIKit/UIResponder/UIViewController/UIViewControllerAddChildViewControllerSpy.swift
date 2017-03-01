//
//  UIViewControllerAddChildViewControllerSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let addChildViewControllerCalledString = UUIDKeyString()
    private static let addChildViewControllerCalledKey = ObjectAssociationKey(addChildViewControllerCalledString)
    private static let addChildViewControllerCalledReference = SpyEvidenceReference(key: addChildViewControllerCalledKey)

    private static let addChildViewControllerChildString = UUIDKeyString()
    private static let addChildViewControllerChildKey = ObjectAssociationKey(addChildViewControllerChildString)
    private static let addChildViewControllerChildReference = SpyEvidenceReference(key: addChildViewControllerChildKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `addChildViewController(_:)`.
    public enum AddChildViewControllerSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.addChildViewController(_:)),
                spy: #selector(UIViewController.spy_addChildViewController(_:))
            )
            ] as Set
        public static let evidence = [
            addChildViewControllerCalledReference,
            addChildViewControllerChildReference
            ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `addChildViewController(_:)`
    public func spy_addChildViewController(_ child: UIViewController) {
        superclassAddChildViewControllerCalled = true
        superclassAddChildViewControllerChild = child

        spy_addChildViewController(child)
    }


    /// Indicates whether the `addChildViewController(_:)` method has been called on this object's superclass.
    public final var superclassAddChildViewControllerCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.addChildViewControllerCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.addChildViewControllerCalledReference)
        }
    }


    /// Provides the child controller passed to `addChildViewController(_:)` if called.
    public final var superclassAddChildViewControllerChild: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.addChildViewControllerChildReference) as? UIViewController
        }
        set {
            let reference = UIViewController.addChildViewControllerChildReference
            guard let child = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(child, with: reference)
        }
    }
    
}
