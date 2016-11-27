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

    public final func forwardsMethodCalls(for selector: Selector) -> Bool {
        let isException = methodCallForwardingExceptions.contains(selector)
        return isException ? !forwardsMethodCallsByDefault : forwardsMethodCallsByDefault
    }

    public final func addMethodCallForwardingException(for selector: Selector) {
        methodCallForwardingExceptions.insert(selector)
    }

    public final func removeMethodCallForwardingException(for selector: Selector) {
        methodCallForwardingExceptions.remove(selector)
    }

}


fileprivate extension NSObject {

    private static let MethodCallForwardingExceptions = ObjectAssociationKey("MethodCallForwardingExceptions")

    var methodCallForwardingExceptions: Set<Selector> {

        get {
            guard let exceptions = association(for: NSObject.MethodCallForwardingExceptions) as? [Selector] else {
                return []
            }

            return Set(exceptions)
        }

        set {
            guard !newValue.isEmpty else {
                return removeAssociation(for: NSObject.MethodCallForwardingExceptions)
            }

            associate(Array(newValue), with: NSObject.MethodCallForwardingExceptions)
        }

    }

}
