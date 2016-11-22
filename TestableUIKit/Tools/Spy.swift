//
//  Spy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

public protocol Spy: ObjectAssociating {}

public extension Spy {
    func clearSpyKeys(_ keys: [UnsafeRawPointer]) {
        keys.forEach { removeAssociation(for: $0) }
    }
}
