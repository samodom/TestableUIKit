//
//  UIWebViewGoBackSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWebView {

    private static let goBackCalledKeyString = UUIDKeyString()
    private static let goBackCalledKey =
        ObjectAssociationKey(goBackCalledKeyString)
    private static let goBackCalledReference =
        SpyEvidenceReference(key: goBackCalledKey)

    private static let goBackCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.goBack),
        spy: #selector(UIWebView.spy_goBack)
    )


    /// Spy controller for ensuring that a web view has had `goBack` called on it.
    public enum GoBackSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWebView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [goBackCoselectors]
        public static let evidence: Set = [goBackCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `goBack`
    dynamic public func spy_goBack() {
        goBackCalled = true
    }


    /// Indicates whether the `goBack` method has been called on this object.
    public final var goBackCalled: Bool {
        get {
            return loadEvidence(with: UIWebView.goBackCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWebView.goBackCalledReference)
        }
    }

}
