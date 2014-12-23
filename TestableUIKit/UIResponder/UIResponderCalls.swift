//
//  UIResponderCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIResponder {

    public override func becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true

        if shouldForwardMethodCallWithSelector("becomeFirstResponder") {
            return super.becomeFirstResponder()
        }
        else {
            return true
        }
    }

    public override func resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true

        if shouldForwardMethodCallWithSelector("resignFirstResponder") {
            return super.resignFirstResponder()
        }
        else {
            return true
        }
    }

}

extension UIResponder: ShimMethodForwarding {

    /**
      The UIResponder shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /**
      This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method to check for forwarding status.
      @return       Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /**
      Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
      @param        selector Selector of spy method of which to change the forwarding status.
      @param        Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
