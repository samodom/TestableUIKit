//
//  TestingTableView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit


class TestingTableView: UITableView {

    var rowCountsBySection = [Int]()

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)

        commonInitialization()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInitialization()
    }

    private func commonInitialization() {
        dataSource = self
    }

}


extension TestingTableView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return rowCountsBySection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCountsBySection[section]
    }

}
