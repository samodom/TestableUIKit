//
//  UIWebViewGoForwardSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWebView {

    private static let goForwardCalledKeyString = UUIDKeyString()
    private static let goForwardCalledKey =
        ObjectAssociationKey(goForwardCalledKeyString)
    private static let goForwardCalledReference =
        SpyEvidenceReference(key: goForwardCalledKey)

    private static let goForwardCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.goForward),
        spy: #selector(UIWebView.spy_goForward)
    )


    /// Spy controller for ensuring that a web view has had `goForward` called on it.
    public enum GoForwardSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWebView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [goForwardCoselectors]
        public static let evidence: Set = [goForwardCalledReference]
        public static let forwardingBehavior = MethodForwardingBehavior.always
    }


    /// Spy method that replaces the true implementation of `goForward`
    dynamic public func spy_goForward() {
        goForwardCalled = true
    }


    /// Indicates whether the `goForward` method has been called on this object.
    public final var goForwardCalled: Bool {
        get {
            return loadEvidence(with: UIWebView.goForwardCalledReference) as? Bool ?? false
        }
        set {
            let reference = UIWebView.goForwardCalledReference
            guard newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(true, with: reference)
        }
    }

}
