//
//  UIViewControllerViewDidAppearSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let viewDidAppearCalledString = UUIDKeyString()
    private static let viewDidAppearCalledKey = ObjectAssociationKey(viewDidAppearCalledString)
    private static let viewDidAppearCalledReference = SpyEvidenceReference(key: viewDidAppearCalledKey)

    private static let viewDidAppearAnimatedString = UUIDKeyString()
    private static let viewDidAppearAnimatedKey = ObjectAssociationKey(viewDidAppearAnimatedString)
    private static let viewDidAppearAnimatedReference = SpyEvidenceReference(key: viewDidAppearAnimatedKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `viewDidAppear(_:)`.
    public enum ViewDidAppearSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.viewDidAppear(_:)),
                spy: #selector(UIViewController.spy_viewDidAppear(_:))
            )
            ] as Set
        public static let evidence = [
            viewDidAppearCalledReference,
            viewDidAppearAnimatedReference
            ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `viewDidAppear(_:)`
    public func spy_viewDidAppear(_ animated: Bool) {
        superclassViewDidAppearCalled = true
        superclassViewDidAppearAnimated = animated

        spy_viewDidAppear(animated)
    }


    /// Indicates whether the `viewDidAppear(_:)` method has been called on this object's superclass.
    public final var superclassViewDidAppearCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.viewDidAppearCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.viewDidAppearCalledReference)
        }
    }


    /// Provides the animation flag passed to `viewDidAppear(_:)` if called.
    public final var superclassViewDidAppearAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.viewDidAppearAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.viewDidAppearAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }
    
}
