//
//  CustomForwardingObject.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/19/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation


class CustomForwardingObject: NSObject {

    private static let CustomMethodForwardingFlagKey = UnsafeRawPointer("CustomMethodForwardingFlag")

    override var forwardsMethodCallsByDefault: Bool {
        get {
            let forwards = associationForKey(CustomForwardingObject.CustomMethodForwardingFlagKey) as? Bool
            return forwards ?? super.forwardsMethodCallsByDefault
        }
        set {
            let key = CustomForwardingObject.CustomMethodForwardingFlagKey
            guard newValue != super.forwardsMethodCallsByDefault else {
                return removeAssociationForKey(key)
            }

            associate(newValue, withKey: key)
        }
    }

}
