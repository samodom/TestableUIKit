//
//  CustomForwardingObject.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/19/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

class CustomForwardingObject: NSObject {

    private static let CustomMethodForwardingFlagKey = UnsafeRawPointer("CustomMethodForwardingFlag")

    override var forwardsMethodCallsByDefault: Bool {
        get {
            return booleanAssociation(
                for: CustomForwardingObject.CustomMethodForwardingFlagKey,
                defaultValue: super.forwardsMethodCallsByDefault
            )
        }
        set {
            let key = CustomForwardingObject.CustomMethodForwardingFlagKey
            guard newValue != super.forwardsMethodCallsByDefault else {
                return removeAssociation(for: key)
            }

            associate(newValue, with: key)
        }
    }

}
