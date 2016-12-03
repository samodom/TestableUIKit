//
//  UIWindowEvidence.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/26/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


enum UIWindowSpyCaptureKeys {

    /// `makeKey`

    static let makeKey = [makeKeyCalled]
    private static let makeKeyCalledString = UUIDKeyString()
    static let makeKeyCalled = ObjectAssociationKey(makeKeyCalledString)


    /// `makeKeyAndVisible`

    static let makeKeyAndVisible = [makeKeyAndVisibleCalled]
    private static let makeKeyAndVisibleCalledString = UUIDKeyString()
    static let makeKeyAndVisibleCalled = ObjectAssociationKey(makeKeyAndVisibleCalledString)

}


public extension UIWindow {

    /// Indicates whether the `makeKey` method has been called on this object.
    public final var makeKeyCalled: Bool {
        get {
            return booleanAssociation(for: UIWindowSpyCaptureKeys.makeKeyCalled, defaultValue: false)
        }
        set {
            let key = UIWindowSpyCaptureKeys.makeKeyCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }


    /// Indicates whether the `makeKeyAndVisible` method has been called on this object.
    public final var makeKeyAndVisibleCalled: Bool {
        get {
            return booleanAssociation(
                for: UIWindowSpyCaptureKeys.makeKeyAndVisibleCalled,
                defaultValue: false
            )
        }
        set {
            let key = UIWindowSpyCaptureKeys.makeKeyAndVisibleCalled
            guard newValue else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }

}
