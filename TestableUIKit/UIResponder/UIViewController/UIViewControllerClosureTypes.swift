//
//  UIViewControllerClosureTypes.swift
//  TestableUIKit
//
//  Created by Sam Odom on 2/27/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import FoundationSwagger

/// Closure type used for providing a set of animations
public typealias UIViewAnimations = NullaryVoidClosure


/// Closure type used after animations are complete
public typealias UIViewAnimationsCompletion = (Bool) -> Void
