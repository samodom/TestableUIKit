//
//  ApplicationHelpers.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/19/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

extension UIApplication {

    final class var window: UIWindow {
        return UIApplication.shared.delegate!.window!!
    }

    final class var rootView: UIView {
        return UIApplication.shared.delegate!.window!!.rootViewController!.view
    }

}
