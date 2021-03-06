//
//  CompliantViewSubclass.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class CompliantViewSubclass: CompliantView {

    open override func updateConstraints() {
        super.updateConstraints()
    }

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    open override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    open override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

}
