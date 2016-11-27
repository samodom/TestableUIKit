//
//  Spy.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/21/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger

public protocol Spy: ObjectAssociating {}

extension Spy {

    func clearSpyAssociations(keys: [SpyKey]) {
        keys.forEach { key in
            removeAssociation(for: key.simpleKey)
            if let complexKey = key as? ComplexObjectAssociationKey {
                removeStoredAssociation(for: complexKey)
            }
        }
    }
}
