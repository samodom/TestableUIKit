//
//  UIResponderEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


extension UIResponder {

    enum SpyCaptureKeys {
        private static let calledSuffix = "Called"

        static let becomeFirstResponder = [becomeFirstResponderCalled]
        static let becomeFirstResponderCalled = ObjectAssociationKey("becomeFirstResponder" + calledSuffix)

        static let resignFirstResponder = [resignFirstResponderCalled]
        static let resignFirstResponderCalled = ObjectAssociationKey("resignFirstResponder" + calledSuffix)
    }

}


public extension UIResponder {

    enum OriginalSelectors {
        static let becomeFirstResponder = #selector(UIResponder.becomeFirstResponder)
        static let resignFirstResponder = #selector(UIResponder.resignFirstResponder)
    }

    enum SpySelectors {
        static let becomeFirstResponder = #selector(UIResponder.spy_becomeFirstResponder)
        static let resignFirstResponder = #selector(UIResponder.spy_resignFirstResponder)
    }

    public enum SpyAssociations {
        public static let becomeFirstResponder = MethodAssociation(
            forClass: UIResponder.self,
            ofType: .instance,
            originalSelector: OriginalSelectors.becomeFirstResponder,
            alternateSelector: SpySelectors.becomeFirstResponder
        )

        public static let resignFirstResponder = MethodAssociation(
            forClass: UIResponder.self,
            ofType: .instance,
            originalSelector: OriginalSelectors.resignFirstResponder,
            alternateSelector: SpySelectors.resignFirstResponder
        )
        
    }

}


public extension UIResponder {

    /// Indicates whether the `becomeFirstResponder` method has been called on this object.
    public final var becomeFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: SpyCaptureKeys.becomeFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: SpyCaptureKeys.becomeFirstResponderCalled)
        }
    }


    /// Indicates whether the `resignFirstResponder` method has been called on this object.
    public final var resignFirstResponderCalled: Bool {
        get {
            return booleanAssociation(
                for: SpyCaptureKeys.resignFirstResponderCalled,
                defaultValue: false
            )
        }
        set {
            associate(newValue, with: SpyCaptureKeys.resignFirstResponderCalled)
        }
    }

}
