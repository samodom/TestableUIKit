//
//  UIViewControllerViewDidDisappearSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let viewDidDisappearCalledString = UUIDKeyString()
    private static let viewDidDisappearCalledKey = ObjectAssociationKey(viewDidDisappearCalledString)
    private static let viewDidDisappearCalledReference = SpyEvidenceReference(key: viewDidDisappearCalledKey)

    private static let viewDidDisappearAnimatedString = UUIDKeyString()
    private static let viewDidDisappearAnimatedKey = ObjectAssociationKey(viewDidDisappearAnimatedString)
    private static let viewDidDisappearAnimatedReference = SpyEvidenceReference(key: viewDidDisappearAnimatedKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `viewDidDisappear(_:)`.
    public enum ViewDidDisappearSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.viewDidDisappear(_:)),
                spy: #selector(UIViewController.spy_viewDidDisappear(_:))
            )
            ] as Set
        public static let evidence = [
            viewDidDisappearCalledReference,
            viewDidDisappearAnimatedReference
            ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `viewDidDisappear(_:)`
    public func spy_viewDidDisappear(_ animated: Bool) {
        superclassViewDidDisappearCalled = true
        superclassViewDidDisappearAnimated = animated

        spy_viewDidDisappear(animated)
    }


    /// Indicates whether the `viewDidDisappear(_:)` method has been called on this object's superclass.
    public final var superclassViewDidDisappearCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.viewDidDisappearCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.viewDidDisappearCalledReference)
        }
    }


    /// Provides the animation flag passed to `viewDidDisappear(_:)` if called.
    public final var superclassViewDidDisappearAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.viewDidDisappearAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.viewDidDisappearAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }
    
}
