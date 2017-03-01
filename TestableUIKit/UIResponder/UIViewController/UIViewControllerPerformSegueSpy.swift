//
//  UIViewControllerPerformSegueSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let performSegueCalledString = UUIDKeyString()
    private static let performSegueCalledKey = ObjectAssociationKey(performSegueCalledString)
    private static let performSegueCalledReference = SpyEvidenceReference(key: performSegueCalledKey)

    private static let performSegueIdentifierString = UUIDKeyString()
    private static let performSegueIdentifierKey = ObjectAssociationKey(performSegueIdentifierString)
    private static let performSegueIdentifierReference = SpyEvidenceReference(key: performSegueIdentifierKey)

    private static let performSegueSenderString = UUIDKeyString()
    private static let performSegueSenderKey = ObjectAssociationKey(performSegueSenderString)
    private static let performSegueSenderReference = SpyEvidenceReference(key: performSegueSenderKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `performSegue(withIdentifier:sender:)` invoked.
    public enum PerformSegueSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.performSegue(withIdentifier:sender:)),
                spy: #selector(UIViewController.spy_performSegue(withIdentifier:sender:))
            )
        ] as Set
        public static let evidence = [
            performSegueCalledReference,
            performSegueIdentifierReference,
            performSegueSenderReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `performSegue(withIdentifier:sender:)`
    public func spy_performSegue(withIdentifier identifier: String, sender: Any? = nil) {
        performSegueCalled = true
        performSegueIdentifier = identifier
        performSegueSender = sender

        spy_performSegue(withIdentifier: identifier, sender: sender)
    }


    /// Indicates whether the `performSegue(withIdentifier:sender:)` method has been 
    /// called on this object.
    public final var performSegueCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.performSegueCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.performSegueCalledReference)
        }
    }


    /// Provides the segue identifier passed to `performSegue(withIdentifier:sender:)` if called.
    public final var performSegueIdentifier: String? {
        get {
            return loadEvidence(with: UIViewController.performSegueIdentifierReference) as? String
        }
        set {
            let reference = UIViewController.performSegueIdentifierReference
            guard let identifier = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(identifier, with: reference)
        }
    }


    /// Provides the sender passed to `performSegue(withIdentifier:sender:)` if called.
    public final var performSegueSender: Any? {
        get {
            return loadEvidence(with: UIViewController.performSegueSenderReference)
        }
        set {
            let reference = UIViewController.performSegueSenderReference
            guard let sender = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sender, with: reference)
        }
    }

}
