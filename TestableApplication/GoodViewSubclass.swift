//
//  GoodViewSubclass.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

internal class GoodViewSubclass: GoodView {

    internal override func updateConstraints() {
        super.updateConstraints()
    }

    internal override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    internal override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    internal override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

}
