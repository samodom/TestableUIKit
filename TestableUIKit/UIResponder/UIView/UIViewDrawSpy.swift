//
//  UIViewDrawSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/10/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let drawCalledKeyString = UUIDKeyString()
    private static let drawCalledKey =
        ObjectAssociationKey(drawCalledKeyString)
    private static let drawCalledReference =
        SpyEvidenceReference(key: drawCalledKey)

    private static let drawRectKeyString = UUIDKeyString()
    private static let drawRectKey =
        ObjectAssociationKey(drawRectKeyString)
    private static let drawRectReference =
        SpyEvidenceReference(key: drawRectKey)

    private static let drawCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.draw(_:)),
        spy: #selector(UIView.spy_draw(_:))
    )


    /// Spy controller for ensuring that a subclass calls its superclass implementation
    /// of `draw(_:)` when the same method is invoked on it.
    public enum DrawSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.indirect
        public static let coselectors: Set = [drawCoselectors]
        public static let evidence: Set = [drawCalledReference, drawRectReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `draw(_:)`
    dynamic public func spy_draw(_ rect: CGRect) {
        superclassDrawCalled = true
        superclassDrawRect = rect

        spy_draw(rect)
    }


    /// Indicates whether the `draw(_:)` method has been called on this object's superclass.
    public final var superclassDrawCalled: Bool {
        get {
            return loadEvidence(with: UIView.drawCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.drawCalledReference)
        }
    }


    /// Provides the captured rect from a call to the `draw(_:)` method, if called.
    public final var superclassDrawRect: CGRect? {
        get {
            return loadEvidence(with: UIView.drawRectReference) as? CGRect
        }
        set {
            let reference = UIView.drawRectReference
            guard let rect = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(rect, with: reference)
        }
    }

}
