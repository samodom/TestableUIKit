//
//  UIWindowCalls.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/23/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension TestableUIKit.UIWindow {

    public override func makeKeyWindow() {
        makeKeyWindowCalled = true

        let selector = UIWindowTestableSelectors.MakeKeyWindow
        if UIWindow.shouldForwardMethodCallWithSelector(selector) {
            super.makeKeyWindow()
        }
    }

    public override func makeKeyAndVisible() {
        makeKeyAndVisibleCalled = true

        let selector = UIWindowTestableSelectors.MakeKeyWindowAndVisible
        if UIWindow.shouldForwardMethodCallWithSelector(selector) {
            super.makeKeyAndVisible()
        }
    }

}
