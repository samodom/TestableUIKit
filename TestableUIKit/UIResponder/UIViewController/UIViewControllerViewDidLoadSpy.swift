//
//  UIViewControllerViewDidLoadSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let viewDidLoadCalledString = UUIDKeyString()
    private static let viewDidLoadCalledKey = ObjectAssociationKey(viewDidLoadCalledString)
    private static let viewDidLoadCalledReference = SpyEvidenceReference(key: viewDidLoadCalledKey)


    /// Spy controller for ensuring a controller has called its superclass's
    /// implementation of `viewDidLoad`.
    public enum ViewDidLoadSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.viewDidLoad),
                spy: #selector(UIViewController.spy_viewDidLoad)
            )
            ] as Set
        public static let evidence = [viewDidLoadCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `viewDidLoad`
    public func spy_viewDidLoad() {
        superclassViewDidLoadCalled = true
        spy_viewDidLoad()
    }


    /// Indicates whether the `viewDidLoad` method has been called on this object's superclass.
    public final var superclassViewDidLoadCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.viewDidLoadCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.viewDidLoadCalledReference)
        }
    }
    
}
