//
//  ShimMethodForwarding.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import Foundation

public protocol ShimMethodForwarding {
    func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool
    func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool)
}

internal class ShimMethodForwardingBlockerList: ShimMethodForwarding {

    private var blockerList = [Selector:Selector]()

    internal func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return blockerList[selector] == nil
    }

    internal func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        if !shouldForward {
            blockerList[selector] = selector
        }
        else {
            blockerList[selector] = nil
        }
    }

}
