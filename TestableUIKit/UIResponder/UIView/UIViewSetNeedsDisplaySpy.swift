//
//  UIViewSetNeedsDisplaySpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let setNeedsDisplayCalledKeyString = UUIDKeyString()
    private static let setNeedsDisplayCalledKey =
        ObjectAssociationKey(setNeedsDisplayCalledKeyString)
    private static let setNeedsDisplayCalledReference =
        SpyEvidenceReference(key: setNeedsDisplayCalledKey)

    private static let setNeedsDisplayRectKeyString = UUIDKeyString()
    private static let setNeedsDisplayRectKey =
        ObjectAssociationKey(setNeedsDisplayRectKeyString)
    private static let setNeedsDisplayRectReference =
        SpyEvidenceReference(key: setNeedsDisplayRectKey)

    private static let setNeedsDisplayNullaryCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.setNeedsDisplay as (UIView) -> () -> Void),
        spy: #selector(UIView.spy_setNeedsDisplay as (UIView) -> () -> Void)
    )
    private static let setNeedsDisplayUnaryCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.setNeedsDisplay(_:)),
        spy: #selector(UIView.spy_setNeedsDisplay(_:))
    )


    /// Spy controller for ensuring that a view has had `setNeedsDisplay` called on it.
    public enum SetNeedsDisplaySpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [
            setNeedsDisplayNullaryCoselectors,
            setNeedsDisplayUnaryCoselectors
        ]
        public static let evidence: Set = [
            setNeedsDisplayCalledReference,
            setNeedsDisplayRectReference
        ]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `setNeedsDisplay`
    dynamic public func spy_setNeedsDisplay() {
        setNeedsDisplayCalled = true
        spy_setNeedsDisplay()
    }


    /// Spy method that replaces the true implementation of `setNeedsDisplay(_:)`
    dynamic public func spy_setNeedsDisplay(_ rect: CGRect) {
        setNeedsDisplayCalled = true
        setNeedsDisplayRect = rect

        spy_setNeedsDisplay(rect)
    }


    /// Indicates whether the `setNeedsDisplay` or `setNeedsDisplay(_:)`
    /// method has been called on this object.
    public final var setNeedsDisplayCalled: Bool {
        get {
            return loadEvidence(with: UIView.setNeedsDisplayCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.setNeedsDisplayCalledReference)
        }
    }


    /// Provides the rect passed to `setNeedsDisplay(_:)` if called.
    public final var setNeedsDisplayRect: CGRect? {
        get {
            return loadEvidence(with: UIView.setNeedsDisplayRectReference) as? CGRect
        }
        set {
            let reference = UIView.setNeedsDisplayRectReference
            guard let rect = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(rect, with: reference)
        }
    }

}
