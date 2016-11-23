//
//  UIResponderEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


enum UIResponderSpyCaptureKeys {
    private static let calledSuffix = "Called"

    static let becomeFirstResponder = [becomeFirstResponderCalled]
    static let becomeFirstResponderCalled = ObjectAssociationKey("becomeFirstResponder" + calledSuffix)

    static let resignFirstResponder = [resignFirstResponderCalled]
    static let resignFirstResponderCalled = ObjectAssociationKey("resignFirstResponder" + calledSuffix)
}




public extension UIResponder {

    /// Indicates whether the `becomeFirstResponder` method has been called on this object.
    public final var becomeFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: UIResponderSpyCaptureKeys.becomeFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: UIResponderSpyCaptureKeys.becomeFirstResponderCalled)
        }
    }


    /// Indicates whether the `resignFirstResponder` method has been called on this object.
    public final var resignFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: UIResponderSpyCaptureKeys.resignFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: UIResponderSpyCaptureKeys.resignFirstResponderCalled)
        }
    }

}
