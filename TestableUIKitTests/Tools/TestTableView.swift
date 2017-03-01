//
//  TestTableView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 11/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit


class TestTableView: UITableView {

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

    var reloadDataTestMethodCalled = false
    dynamic override func reloadData() {
        reloadDataTestMethodCalled = true
    }

    var beginUpdatesTestMethodCalled = false
    dynamic override func beginUpdates() {
        beginUpdatesTestMethodCalled = true
    }

    var endUpdatesTestMethodCalled = false
    dynamic override func endUpdates() {
        endUpdatesTestMethodCalled = true
    }

    var reloadSectionsTestMethodCalled = false
    dynamic override func reloadSections(
        _ sections: IndexSet,
        with animation: UITableViewRowAnimation
        ) {

        reloadSectionsTestMethodCalled = true
    }

    var reloadSectionIndexTitlesTestMethodCalled = false
    dynamic override func reloadSectionIndexTitles() {
        reloadSectionIndexTitlesTestMethodCalled = true
    }

    var reloadRowsTestMethodCalled = false
    dynamic override func reloadRows(
        at rows: [IndexPath],
        with animation: UITableViewRowAnimation
        ) {

        reloadRowsTestMethodCalled = true
    }

}


extension TestTableView: UITableViewDataSource {

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
