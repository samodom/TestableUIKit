//
//  UIViewControllerRemoveFromParentViewControllerSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let removeFromParentViewControllerCalledString = UUIDKeyString()
    private static let removeFromParentViewControllerCalledKey = ObjectAssociationKey(removeFromParentViewControllerCalledString)
    private static let removeFromParentViewControllerCalledReference = SpyEvidenceReference(key: removeFromParentViewControllerCalledKey)


    /// Spy controller for ensuring a controller has not called its superclass's
    /// implementation of `removeFromParentViewController`.
    public enum RemoveFromParentViewControllerSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.removeFromParentViewController),
                spy: #selector(UIViewController.spy_removeFromParentViewController)
            )
        ] as Set
        public static let evidence = [removeFromParentViewControllerCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `removeFromParentViewController`
    public func spy_removeFromParentViewController() {
        superclassRemoveFromParentViewControllerCalled = true
        spy_removeFromParentViewController()
    }


    /// Indicates whether the `removeFromParentViewController` method has been called on this object's superclass.
    public final var superclassRemoveFromParentViewControllerCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.removeFromParentViewControllerCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.removeFromParentViewControllerCalledReference)
        }
    }

}
