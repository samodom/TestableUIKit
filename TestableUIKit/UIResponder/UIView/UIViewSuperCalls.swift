//
//  UIView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

extension TestableUIKit.UIView {

    open override func updateConstraints() {
        calledUpdateConstraints = true
        super.updateConstraints()
    }

    open override func draw(_ rect: CGRect) {
        calledDrawRect = true
        drawRectRect = rect
        super.draw(rect)
    }

    open override func encodeRestorableState(with coder: NSCoder) {
        calledEncodeRestorableStateWithCoder = true
        encodeRestorableStateCoder = coder
        super.encodeRestorableState(with: coder)
    }

    open override func decodeRestorableState(with coder: NSCoder) {
        calledDecodeRestorableStateWithCoder = true
        decodeRestorableStateCoder = coder
        super.decodeRestorableState(with: coder)
    }

}
