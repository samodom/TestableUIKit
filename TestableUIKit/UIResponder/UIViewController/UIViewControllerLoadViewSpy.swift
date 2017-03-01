//
//  UIViewControllerLoadViewSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let loadViewCalledString = UUIDKeyString()
    private static let loadViewCalledKey = ObjectAssociationKey(loadViewCalledString)
    private static let loadViewCalledReference = SpyEvidenceReference(key: loadViewCalledKey)


    /// Spy controller for ensuring a controller has not called its superclass's
    /// implementation of `loadView`.
    public enum LoadViewSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.loadView),
                spy: #selector(UIViewController.spy_loadView)
            )
        ] as Set
        public static let evidence = [loadViewCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `loadView`
    public func spy_loadView() {
        superclassLoadViewCalled = true
        spy_loadView()
    }


    /// Indicates whether the `loadView` method has been called on this object's superclass.
    public final var superclassLoadViewCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.loadViewCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.loadViewCalledReference)
        }
    }

}
