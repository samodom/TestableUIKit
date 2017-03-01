//
//  UIViewControllerViewWillDisappearSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let viewWillDisappearCalledString = UUIDKeyString()
    private static let viewWillDisappearCalledKey = ObjectAssociationKey(viewWillDisappearCalledString)
    private static let viewWillDisappearCalledReference = SpyEvidenceReference(key: viewWillDisappearCalledKey)

    private static let viewWillDisappearAnimatedString = UUIDKeyString()
    private static let viewWillDisappearAnimatedKey = ObjectAssociationKey(viewWillDisappearAnimatedString)
    private static let viewWillDisappearAnimatedReference = SpyEvidenceReference(key: viewWillDisappearAnimatedKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `viewWillDisappear(_:)`.
    public enum ViewWillDisappearSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.viewWillDisappear(_:)),
                spy: #selector(UIViewController.spy_viewWillDisappear(_:))
            )
            ] as Set
        public static let evidence = [
            viewWillDisappearCalledReference,
            viewWillDisappearAnimatedReference
            ] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `viewWillDisappear(_:)`
    public func spy_viewWillDisappear(_ animated: Bool) {
        superclassViewWillDisappearCalled = true
        superclassViewWillDisappearAnimated = animated

        spy_viewWillDisappear(animated)
    }


    /// Indicates whether the `viewWillDisappear(_:)` method has been called on this object's superclass.
    public final var superclassViewWillDisappearCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.viewWillDisappearCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.viewWillDisappearCalledReference)
        }
    }


    /// Provides the animation flag passed to `viewWillDisappear(_:)` if called.
    public final var superclassViewWillDisappearAnimated: Bool? {
        get {
            return loadEvidence(with: UIViewController.viewWillDisappearAnimatedReference) as? Bool
        }
        set {
            let reference = UIViewController.viewWillDisappearAnimatedReference
            guard let animated = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(animated, with: reference)
        }
    }
    
}
