//
//  UIView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public extension UIView {

    public override func updateConstraints() {
        calledUpdateConstraints = true
        super.updateConstraints()
    }

    public override func drawRect(rect: CGRect) {
        calledDrawRect = true
        drawRectRect = rect
        super.drawRect(rect)
    }

    public override func encodeRestorableStateWithCoder(coder: NSCoder) {
        calledEncodeRestorableStateWithCoder = true
        encodeRestorableStateCoder = coder
        super.encodeRestorableStateWithCoder(coder)
    }

    public override func decodeRestorableStateWithCoder(coder: NSCoder) {
        calledDecodeRestorableStateWithCoder = true
        decodeRestorableStateCoder = coder
        super.decodeRestorableStateWithCoder(coder)
    }

}
