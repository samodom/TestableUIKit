//
//  UIWebViewStopLoadingSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIWebView {

    private static let stopLoadingCalledKeyString = UUIDKeyString()
    private static let stopLoadingCalledKey =
        ObjectAssociationKey(stopLoadingCalledKeyString)
    private static let stopLoadingCalledReference =
        SpyEvidenceReference(key: stopLoadingCalledKey)

    private static let stopLoadingCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIWebView.stopLoading),
        spy: #selector(UIWebView.spy_stopLoading)
    )


    /// Spy controller for ensuring that a web view has had `stopLoading` called on it.
    public enum StopLoadingSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIWebView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [stopLoadingCoselectors]
        public static let evidence: Set = [stopLoadingCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `stopLoading`
    dynamic public func spy_stopLoading() {
        stopLoadingCalled = true
    }


    /// Indicates whether the `stopLoading` method has been called on this object.
    public final var stopLoadingCalled: Bool {
        get {
            return loadEvidence(with: UIWebView.stopLoadingCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIWebView.stopLoadingCalledReference)
        }
    }

}
