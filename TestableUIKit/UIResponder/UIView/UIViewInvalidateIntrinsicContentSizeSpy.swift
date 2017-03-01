//
//  UIViewInvalidateIntrinsicContentSizeSpy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/21/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//


import UIKit
import TestSwagger
import FoundationSwagger


public extension UIView {

    private static let invalidateIntrinsicContentSizeCalledKeyString = UUIDKeyString()
    private static let invalidateIntrinsicContentSizeCalledKey =
        ObjectAssociationKey(invalidateIntrinsicContentSizeCalledKeyString)
    private static let invalidateIntrinsicContentSizeCalledReference =
        SpyEvidenceReference(key: invalidateIntrinsicContentSizeCalledKey)

    private static let invalidateIntrinsicContentSizeCoselectors = SpyCoselectors(
        methodType: .instance,
        original: #selector(UIView.invalidateIntrinsicContentSize),
        spy: #selector(UIView.spy_invalidateIntrinsicContentSize)
    )


    /// Spy controller for ensuring that a view has had `invalidateIntrinsicContentSize` called on it.
    public enum InvalidateIntrinsicContentSizeSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = UIView.self
        public static let vector = SpyVector.direct
        public static let coselectors: Set = [invalidateIntrinsicContentSizeCoselectors]
        public static let evidence: Set = [invalidateIntrinsicContentSizeCalledReference]
        public static let forwardsInvocations = true
    }


    /// Spy method that replaces the true implementation of `invalidateIntrinsicContentSize`
    dynamic public func spy_invalidateIntrinsicContentSize() {
        invalidateIntrinsicContentSizeCalled = true
        spy_invalidateIntrinsicContentSize()
    }


    /// Indicates whether the `invalidateIntrinsicContentSize` method has been called on this object.
    public final var invalidateIntrinsicContentSizeCalled: Bool {
        get {
            return loadEvidence(with: UIView.invalidateIntrinsicContentSizeCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: UIView.invalidateIntrinsicContentSizeCalledReference)
        }
    }

}
