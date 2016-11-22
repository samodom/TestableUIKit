//
//  MethodCallForwarding.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import FoundationSwagger

extension NSObject {
    open var forwardsMethodCallsByDefault: Bool {
        return true
    }
}

public extension NSObject {

    public final func forwardsMethodCalls(forSelector selector: Selector) -> Bool {
        let isException = methodCallForwardingExceptions.contains(selector)
        return isException ? !forwardsMethodCallsByDefault : forwardsMethodCallsByDefault
    }

    public final func addMethodCallForwardingException(forSelector selector: Selector) {
        methodCallForwardingExceptions.insert(selector)
    }

    public final func removeMethodCallForwardingException(forSelector selector: Selector) {
        methodCallForwardingExceptions.remove(selector)
    }

}


fileprivate extension NSObject {

    private static let MethodCallForwardingExceptions = ObjectAssociationKey("MethodCallForwardingExceptions")

    var methodCallForwardingExceptions: Set<Selector> {
        get {
            return forwardingExceptionsSelectorStrings.reduce(Set<Selector>()) {
                var accumulator = $0.0
                let selectorString = $0.1
                accumulator.insert(NSSelectorFromString(selectorString))
                return accumulator
            }
        }
        set {
            forwardingExceptionsSelectorStrings = newValue.reduce(Set<String>()) {
                var accumulator = $0.0
                let selector = $0.1
                accumulator.insert(NSStringFromSelector(selector))
                return accumulator
            }
        }
    }

    private var forwardingExceptionsSelectorStrings: Set<String> {
        get {
            let exceptions = association(for: NSObject.MethodCallForwardingExceptions) as? Set<String>
            return exceptions ?? []
        }
        set {
            guard !newValue.isEmpty else {
                return removeAssociation(for: NSObject.MethodCallForwardingExceptions)
            }

            associate(newValue, with: NSObject.MethodCallForwardingExceptions)
        }
    }

}
