//
//  UIWindowMakeKeySpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWindow {

    private static let makeKeyCalledKeyString = UUIDKeyString()
    private static let makeKeyCalledKey =
        ObjectAssociationKey(makeKeyCalledKeyString)
    private static let makeKeyCalledReference =
        SpyEvidenceReference(key: makeKeyCalledKey)

    private static let makeKeyCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWindow.makeKey),
        spy: #selector(UIWindow.spy_makeKey)
    )


    /// Spy controller for ensuring that a window has had `makeKey` called on it.
    public enum MakeKeySpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWindow.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [makeKeyCoselectors]
        public static let evidence: Set = [makeKeyCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `makeKey`
    dynamic public func spy_makeKey() {
        makeKeyCalled = true
        spy_makeKey()
    }


    /// Indicates whether the `makeKey` method has been called on this object.
    public final var makeKeyCalled: Bool {
        get {
            return loadEvidence(with: UIWindow.makeKeyCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWindow.makeKeyCalledReference)
        }
    }

}
