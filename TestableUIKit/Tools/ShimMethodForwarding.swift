//
//  ShimMethodForwarding.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import Foundation

public typealias ShimMethodForwardingList = [Selector: Bool]

public protocol ShimMethodForwarding {
    static var methodForwardingList: ShimMethodForwardingList { get set }
    static var shouldForwardMethodsByDefault: Bool { get set }
}


public extension ShimMethodForwarding {

    /*!
     This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
     :param: selector Selector of spy method to check for forwarding status.
     :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
     */
    public static func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return methodForwardingList[selector] ?? shouldForwardMethodsByDefault
    }

    /*!
     Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
     :param: selector Selector of spy method of which to change the forwarding status.
     :param: Boolean value indicating whether or not the method calls should be forwarded.
     */
    public static func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        methodForwardingList[selector] = shouldForward
    }

}
