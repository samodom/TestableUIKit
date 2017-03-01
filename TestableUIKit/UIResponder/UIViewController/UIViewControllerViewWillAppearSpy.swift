//
//  UIViewControllerViewWillAppearSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let viewWillAppearCalledString = UUIDKeyString()
    private static let viewWillAppearCalledKey = ObjectAssociationKey(viewWillAppearCalledString)
    private static let viewWillAppearCalledReference = SpyEvidenceReference(key: viewWillAppearCalledKey)

    private static let viewWillAppearAnimatedString = UUIDKeyString()
    private static let viewWillAppearAnimatedKey = ObjectAssociationKey(viewWillAppearAnimatedString)
    private static let viewWillAppearAnimatedReference = SpyEvidenceReference(key: viewWillAppearAnimatedKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `viewWillAppear(_:)`.
    public enum ViewWillAppearSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.viewWillAppear(_:)),
                spy: #selector(UIViewController.spy_viewWillAppear(_:))
            )
            ] as Set
        public static let evidence = [
            viewWillAppearCalledReference,
            viewWillAppearAnimatedReference
            ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `viewWillAppear(_:)`
    public func spy_viewWillAppear(_ animated: Bool) {
        superclassViewWillAppearCalled = true
        superclassViewWillAppearAnimated = animated

        spy_viewWillAppear(animated)
    }


    /// Indicates whether the `viewWillAppear(_:)` method has been called on this object's superclass.
    public final var superclassViewWillAppearCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.viewWillAppearCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.viewWillAppearCalledReference)
        }
    }


    /// Provides the animation flag passed to `viewWillAppear(_:)` if called.
    public final var superclassViewWillAppearAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.viewWillAppearAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.viewWillAppearAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }
    
}
