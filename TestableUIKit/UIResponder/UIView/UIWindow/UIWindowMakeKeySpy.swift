//
//  UIWindowMakeKeyAndVisibleSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWindow {

    private static let makeKeyAndVisibleCalledKeyString = UUIDKeyString()
    private static let makeKeyAndVisibleCalledKey =
        ObjectAssociationKey(makeKeyAndVisibleCalledKeyString)
    private static let makeKeyAndVisibleCalledReference =
        SpyEvidenceReference(key: makeKeyAndVisibleCalledKey)

    private static let makeKeyAndVisibleCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWindow.makeKeyAndVisible),
        spy: #selector(UIWindow.spy_makeKeyAndVisible)
    )


    /// Spy controller for ensuring that a window has had `makeKeyAndVisible` called on it.
    public enum MakeKeyAndVisibleSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWindow.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [makeKeyAndVisibleCoselectors]
        public static let evidence: Set = [makeKeyAndVisibleCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `makeKeyAndVisible`
    dynamic public func spy_makeKeyAndVisible() {
        makeKeyAndVisibleCalled = true
        spy_makeKeyAndVisible()
    }


    /// Indicates whether the `makeKeyAndVisible` method has been called on this object.
    public final var makeKeyAndVisibleCalled: Bool {
        get {
            return loadEvidence(with: UIWindow.makeKeyAndVisibleCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWindow.makeKeyAndVisibleCalledReference)
        }
    }

}
