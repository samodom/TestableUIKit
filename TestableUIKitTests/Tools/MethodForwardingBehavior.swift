//
//  MethodForwardingBehavior.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/20/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import TestSwagger

extension MethodForwardingBehavior: Equatable {}

public func ==(lhs: MethodForwardingBehavior, rhs: MethodForwardingBehavior) -> Bool {

    switch (lhs, rhs) {
    case (.always, .always):
        return true

    case (.never, .never):
        return true

    case (.custom(let leftFlag), .custom(let rightFlag)):
        return leftFlag == rightFlag

    default:
        return false
    }

}
