//
//  UIViewControllerShowSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let showCalledString = UUIDKeyString()
    private static let showCalledKey = ObjectAssociationKey(showCalledString)
    private static let showCalledReference = SpyEvidenceReference(key: showCalledKey)

    private static let showControllerString = UUIDKeyString()
    private static let showControllerKey = ObjectAssociationKey(showControllerString)
    private static let showControllerReference = SpyEvidenceReference(key: showControllerKey)

    private static let showSenderString = UUIDKeyString()
    private static let showSenderKey = ObjectAssociationKey(showSenderString)
    private static let showSenderReference = SpyEvidenceReference(key: showSenderKey)


    /// Spy controller for ensuring a controller has had its implementation of
    /// `show(_:sender:)` or `showDetailViewController(_:sender:)` invoked.
    public enum ShowSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.show(_:sender:)),
                spy: #selector(UIViewController.spy_show(_:sender:))
            ),
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.showDetailViewController(_:sender:)),
                spy: #selector(UIViewController.spy_showDetailViewController(_:sender:))
            )
        ] as Set
        public static let evidence = [
            showCalledReference,
            showControllerReference,
            showSenderReference
        ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `show(_:sender:)`
    public func spy_show(_ controller: UIViewController, sender: Any?) {
        showCalled = true
        showController = controller
        showSender = sender

        spy_show(controller, sender: sender)
    }


    /// Spy method that replaces the true implementation of `showDetailViewController(_:sender:)`
    public func spy_showDetailViewController(_ controller: UIViewController, sender: Any?) {
        showCalled = true
        showController = controller
        showSender = sender

        spy_showDetailViewController(controller, sender: sender)
    }
    

    /// Indicates whether the `show(_:sender:)` or `showDetailViewController(_:sender:)`
    /// method has been called on this object.
    public final var showCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.showCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.showCalledReference)
        }
    }


    /// Provides the view controller passed to `show(_:sender:)` or
    /// `showDetailViewController(_:sender:)` if called.
    public final var showController: UIViewController? {
        get {
            return loadEvidence(with: UIViewController.showControllerReference) as? UIViewController
        }
        set {
            let reference = UIViewController.showControllerReference
            guard let controller = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(controller, with: reference)
        }
    }


    /// Provides the sender passed to `show(_:sender:)` or `showDetailViewController(_:sender:)`
    /// if called.
    public final var showSender: Any? {
        get {
            return loadEvidence(with: UIViewController.showSenderReference)
        }
        set {
            let reference = UIViewController.showSenderReference
            guard let sender = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(sender, with: reference)
        }
    }

}
