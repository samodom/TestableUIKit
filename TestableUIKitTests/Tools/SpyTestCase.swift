//
//  SpyTestCase.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/19/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import FoundationSwagger


class SpyTestCase: XCTestCase {

    var association: MethodAssociation!
    var originalImplementation: IMP!
    var alternateImplementation: IMP!

    var contextExecuted = false

    func inspectImplementations() {
        //  We're only using instance methods for now
        originalImplementation = method_getImplementation(
            class_getInstanceMethod(
                association.owningClass,
                association.originalSelector
            )
        )

        alternateImplementation = method_getImplementation(
            class_getInstanceMethod(
                association.owningClass,
                association.alternateSelector
            )
        )
    }

    func validateMethodsAreSwizzled(inFile file: String = #file, atLine line: UInt = #line) {
        validateMethods(areSwizzled: true, inFile: file, atLine: line)
    }

    func validateMethodsAreNotSwizzled(inFile file: String = #file, atLine line: UInt = #line) {
        validateMethods(areSwizzled: false, inFile: file, atLine: line)
    }

    func validateMethods(areSwizzled shouldUseAlternate: Bool, inFile file: String, atLine line: UInt) {

        let selectorForOriginalImplementation =
            shouldUseAlternate ? association.alternateSelector : association.originalSelector

        let selectorForAlternateImplementation =
            shouldUseAlternate ? association.originalSelector : association.alternateSelector

        var expectedImplementation = method_getImplementation(
            class_getInstanceMethod(
                association.owningClass,
                selectorForOriginalImplementation
            )
        )

        if expectedImplementation != originalImplementation {
            recordFailure(
                withDescription: "The original selector refers to the wrong method implementation",
                inFile: file,
                atLine: line,
                expected: true
            )
        }

        expectedImplementation = method_getImplementation(
            class_getInstanceMethod(
                association.owningClass,
                selectorForAlternateImplementation
            )
        )

        if expectedImplementation != alternateImplementation {
            recordFailure(
                withDescription: "The spy selector refers to the wrong method implementation",
                inFile: file,
                atLine: line,
                expected: true
            )
        }

    }

}
