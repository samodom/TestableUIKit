//
//  UIWebViewReloadSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWebView {

    private static let reloadCalledKeyString = UUIDKeyString()
    private static let reloadCalledKey =
        ObjectAssociationKey(reloadCalledKeyString)
    private static let reloadCalledReference =
        SpyEvidenceReference(key: reloadCalledKey)

    private static let reloadCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.reload),
        spy: #selector(UIWebView.spy_reload)
    )


    /// Spy controller for ensuring that a web view has had `reload` called on it.
    public enum ReloadSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWebView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [reloadCoselectors]
        public static let evidence: Set = [reloadCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `reload`
    dynamic public func spy_reload() {
        reloadCalled = true
    }


    /// Indicates whether the `reload` method has been called on this object.
    public final var reloadCalled: Bool {
        get {
            return loadEvidence(with: UIWebView.reloadCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWebView.reloadCalledReference)
        }
    }

}
