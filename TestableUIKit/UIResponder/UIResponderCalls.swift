//
//  UIResponderCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIResponder {

    public override func becomeFirstResponder() -> Bool {
        becomeFirstResponderCalled = true

        let selector = UIResponderTestableSelectors.BecomeFirstResponder
        return UIResponder.shouldForwardMethodCallWithSelector(selector) ?
            super.becomeFirstResponder() : true
    }

    public override func resignFirstResponder() -> Bool {
        resignFirstResponderCalled = true

        let selector = UIResponderTestableSelectors.ResignFirstResponder
        return UIResponder.shouldForwardMethodCallWithSelector(selector) ?
            super.resignFirstResponder() : true
    }

}
