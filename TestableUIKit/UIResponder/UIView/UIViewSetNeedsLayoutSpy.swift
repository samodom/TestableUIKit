//
//  UIViewSetNeedsLayoutSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let setNeedsLayoutCalledKeyString = UUIDKeyString()
    private static let setNeedsLayoutCalledKey =
        ObjectAssociationKey(setNeedsLayoutCalledKeyString)
    private static let setNeedsLayoutCalledReference =
        SpyEvidenceReference(key: setNeedsLayoutCalledKey)

    private static let setNeedsLayoutCalledOnMainThreadKeyString = UUIDKeyString()
    private static let setNeedsLayoutCalledOnMainThreadKey =
        ObjectAssociationKey(setNeedsLayoutCalledOnMainThreadKeyString)
    private static let setNeedsLayoutCalledOnMainThreadReference =
        SpyEvidenceReference(key: setNeedsLayoutCalledOnMainThreadKey)

    private static let setNeedsLayoutCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.setNeedsLayout),
        spy: #selector(UIView.spy_setNeedsLayout)
    )


    /// Spy controller for ensuring that a view has had `setNeedsLayout` called on it.
    public enum SetNeedsLayoutSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [setNeedsLayoutCoselectors]
        public static let evidence: Set = [
            setNeedsLayoutCalledReference,
            setNeedsLayoutCalledOnMainThreadReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setNeedsLayout`
    dynamic public func spy_setNeedsLayout() {
        setNeedsLayoutCalled = true
        setNeedsLayoutCalledOnMainThread = Thread.isMainThread

        spy_setNeedsLayout()
    }


    /// Indicates whether the `setNeedsLayout` method has been called on this object.
    public final var setNeedsLayoutCalled: Bool {
        get {
            return loadEvidence(with: UIView.setNeedsLayoutCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.setNeedsLayoutCalledReference)
        }
    }


    /// Indicates whether the `setNeedsLayout` method has been called on the main thread.
    public final var setNeedsLayoutCalledOnMainThread: Bool {
        get {
            return loadEvidence(with: UIView.setNeedsLayoutCalledOnMainThreadReference) as? Bool ?? false
        }
        set {
            let reference = UIView.setNeedsLayoutCalledOnMainThreadReference
            guard newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(true, with: reference)
        }
    }

}
