//
//  UIDevice.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/21/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class UIDevice: UIKit.UIDevice {

    internal var forcedUserInterfaceIdiom: UIUserInterfaceIdiom?

    public func forceUserInterfaceIdiom(idiom: UIUserInterfaceIdiom?) {
        assert(idiom != .Unspecified, "The 'Unspecified' idiom placeholder cannot be forced")
        forcedUserInterfaceIdiom = idiom
    }

    public override var userInterfaceIdiom: UIUserInterfaceIdiom {
        return forcedUserInterfaceIdiom ?? super.userInterfaceIdiom
    }

}
