//
//  CompliantView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

open class CompliantView: UIView {

    public final var compliantViewUpdateConstraintsCalled = false

    dynamic open override func updateConstraints() {
        compliantViewUpdateConstraintsCalled = true
        super.updateConstraints()
    }


    public final var compliantViewDrawCalled = false

    dynamic open override func draw(_ rect: CGRect) {
        compliantViewDrawCalled = true
        super.draw(rect)
    }


    public final var compliantViewEncodeRestorableStateCalled = false

    dynamic open override func encodeRestorableState(with coder: NSCoder) {
        compliantViewEncodeRestorableStateCalled = true
        super.encodeRestorableState(with: coder)
    }


    public final var compliantViewDecodeRestorableStateCalled = false

    dynamic open override func decodeRestorableState(with coder: NSCoder) {
        compliantViewDecodeRestorableStateCalled = true
        super.decodeRestorableState(with: coder)
    }

}
