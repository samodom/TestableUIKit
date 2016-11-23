//
//  UIViewEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


enum UIViewSpyCaptureKeys {
    private static let calledSuffix = "Called"
    private static let rectSuffix = "Rect"
    private static let coderSuffix = "Coder"

    static let updateConstraints = [updateConstraintsCalled]
    static let updateConstraintsCalled = ObjectAssociationKey("updateConstraints" + calledSuffix)

    static let draw = [drawCalled, drawRect]
    private static let drawBase = "draw"
    static let drawCalled = ObjectAssociationKey(drawBase + calledSuffix)
    static let drawRect = ObjectAssociationKey(drawBase + rectSuffix)

    static let encodeRestorableState = [encodeRestorableStateCalled, encodeRestorableStateCoder]
    private static let encodeRestorableStateBase = "encodeRestorableState"
    static let encodeRestorableStateCalled = ObjectAssociationKey(encodeRestorableStateBase + calledSuffix)
    static let encodeRestorableStateCoder = ObjectAssociationKey(encodeRestorableStateBase + coderSuffix)

    static let decodeRestorableState = [decodeRestorableStateCalled, decodeRestorableStateCoder]
    private static let decodeRestorableStateBase = "decodeRestorableState"
    static let decodeRestorableStateCalled = ObjectAssociationKey(decodeRestorableStateBase + calledSuffix)
    static let decodeRestorableStateCoder = ObjectAssociationKey(decodeRestorableStateBase + coderSuffix)

    static let setNeedsLayout = [setNeedsLayoutCalled]
    static let setNeedsLayoutCalled = ObjectAssociationKey("setNeedsLayout" + calledSuffix)

    static let invalidateIntrinsicContentSize = [invalidateIntrinsicContentSizeCalled]
    static let invalidateIntrinsicContentSizeCalled = ObjectAssociationKey("invalidateIntrinsicContentSize" + calledSuffix)

    static let setNeedsUpdateConstraints = [setNeedsUpdateConstraintsCalled]
    static let setNeedsUpdateConstraintsCalled = ObjectAssociationKey("setNeedsUpdateConstraints" + calledSuffix)

    static let setNeedsDisplay = [setNeedsDisplayCalled, setNeedsDisplayRect]
    private static let setNeedsDisplayBase = "setNeedsLayout"
    static let setNeedsDisplayCalled = ObjectAssociationKey(setNeedsDisplayBase + calledSuffix)
    static let setNeedsDisplayRect = ObjectAssociationKey(setNeedsDisplayBase + rectSuffix)
}


public extension UIView {

    /// Indicates whether the `updateConstraints` method has been called on this object.
    public var updateConstraintsCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.updateConstraintsCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.updateConstraintsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `draw(_:)` method has been called on this object.
    public var drawCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.drawCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.drawCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the rect that was passed to `draw(:)`, if called.
    public var drawRect: CGRect? {
        get {
            return association(for: UIViewSpyCaptureKeys.drawRect) as? CGRect
        }
        set {
            let key = UIViewSpyCaptureKeys.drawRect
            guard let rect = newValue else {
                return removeAssociation(for: key)
            }

            associate(rect, with: key)
        }
    }


    /// Indicates whether the `encodeRestorableState(with:)` method has been called on this object.
    public var encodeRestorableStateCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.encodeRestorableStateCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.encodeRestorableStateCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the coder that was passed to `encodeRestorableState(with:)`, if called.
    public var encodeRestorableStateCoder: NSCoder? {
        get {
            return association(for: UIViewSpyCaptureKeys.encodeRestorableStateCoder) as? NSCoder
        }
        set {
            let key = UIViewSpyCaptureKeys.encodeRestorableStateCoder
            guard let coder = newValue else {
                return removeAssociation(for: key)
            }

            associate(coder, with: key)
        }
    }


    /// Indicates whether the `decodeRestorableState(with:)` method has been called on this object.
    public var decodeRestorableStateCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.decodeRestorableStateCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.decodeRestorableStateCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the coder that was passed to `decodeRestorableState(with:)`, if called.
    public var decodeRestorableStateCoder: NSCoder? {
        get {
            return association(for: UIViewSpyCaptureKeys.decodeRestorableStateCoder) as? NSCoder
        }
        set {
            let key = UIViewSpyCaptureKeys.decodeRestorableStateCoder
            guard let coder = newValue else {
                return removeAssociation(for: key)
            }

            associate(coder, with: key)
        }
    }


    /// Indicates whether the `setNeedsLayout` method has been called on this object.
    public var setNeedsLayoutCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.setNeedsLayoutCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.setNeedsLayoutCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }
    

    /// Indicates whether the `invalidateIntrinsicContentSize` method has been called on this object.
    public var invalidateIntrinsicContentSizeCalled: Bool {
        get {
            return booleanAssociation(
                for: UIViewSpyCaptureKeys.invalidateIntrinsicContentSizeCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIViewSpyCaptureKeys.invalidateIntrinsicContentSizeCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `setNeedsUpdateConstraints` method has been called on this object.
    public var setNeedsUpdateConstraintsCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.setNeedsUpdateConstraintsCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.setNeedsUpdateConstraintsCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `setNeedsDisplay` method has been called on this object.
    public var setNeedsDisplayCalled: Bool {
        get {
            return booleanAssociation(for: UIViewSpyCaptureKeys.setNeedsDisplayCalled, defaultValue: false)
        }
        set {
            let key = UIViewSpyCaptureKeys.setNeedsDisplayCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Provides the rect that was passed to `setNeedsDisplay(_:)`, if called.
    public var setNeedsDisplayRect: CGRect? {
        get {
            return association(for: UIViewSpyCaptureKeys.setNeedsDisplayRect) as? CGRect
        }
        set {
            let key = UIViewSpyCaptureKeys.setNeedsDisplayRect
            guard let rect = newValue else {
                return removeAssociation(for: key)
            }

            associate(rect, with: key)
        }
    }

}
