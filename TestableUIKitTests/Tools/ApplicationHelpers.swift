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

    final class var rootViewController: UIViewController {
        get {
            return window.rootViewController!
        }
        set {
            window.rootViewController = newValue
        }
    }

    final class var rootView: UIView {
        get {
            return UIApplication.shared.delegate!.window!!.rootViewController!.view
        }
        set {
            rootViewController.view?.removeFromSuperview()
            rootViewController.view = newValue
        }
    }

}
