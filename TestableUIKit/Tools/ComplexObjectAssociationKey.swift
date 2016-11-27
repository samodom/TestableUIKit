//
//  ComplexObjectAssociationKey.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import FoundationSwagger


protocol SpyKey {
    var simpleKey: ObjectAssociationKey { get }
}


extension ObjectAssociationKey: SpyKey {
    var simpleKey: ObjectAssociationKey {
        return self
    }
}


struct ComplexObjectAssociationKey: SpyKey {
    let simpleKey: ObjectAssociationKey
    let fileKey: String
}
