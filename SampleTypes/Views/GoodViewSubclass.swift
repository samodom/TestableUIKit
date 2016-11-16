//
//  GoodViewSubclass.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public class GoodViewSubclass: GoodView {

    public override func updateConstraints() {
        super.updateConstraints()
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    public override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }

    public override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }

}
