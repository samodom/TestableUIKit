//
//  UIViewControllerDidReceiveMemoryWarningSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/25/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger
import FoundationSwagger

public extension UIViewController {

    private static let didReceiveMemoryWarningCalledString = UUIDKeyString()
    private static let didReceiveMemoryWarningCalledKey = ObjectAssociationKey(didReceiveMemoryWarningCalledString)
    private static let didReceiveMemoryWarningCalledReference = SpyEvidenceReference(key: didReceiveMemoryWarningCalledKey)


    /// Spy controller for ensuring a controller has not called its superclass's
    /// implementation of `didReceiveMemoryWarning`.
    public enum DidReceiveMemoryWarningSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIViewController.self
        public static let vector = SpyVector.indirect
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(UIViewController.didReceiveMemoryWarning),
                spy: #selector(UIViewController.spy_didReceiveMemoryWarning)
            )
        ] as Set
        public static let evidence = [didReceiveMemoryWarningCalledReference] as Set
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `didReceiveMemoryWarning`
    public func spy_didReceiveMemoryWarning() {
        superclassDidReceiveMemoryWarningCalled = true
        spy_didReceiveMemoryWarning()
    }


    /// Indicates whether the `didReceiveMemoryWarning` method has been called on this object's superclass.
    public final var superclassDidReceiveMemoryWarningCalled: Bool {
        get {
            return loadEvidence(with: UIViewController.didReceiveMemoryWarningCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIViewController.didReceiveMemoryWarningCalledReference)
        }
    }

}
