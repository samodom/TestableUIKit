//
//  TestCollectionView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/3/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit
import FoundationSwagger


let CollectionViewCellReuseIdentifier = "CollectionViewCellReuseIdentifier"

class TestCollectionView: UICollectionView {

    var itemCountsBySection = [Int]()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        commonInitialization()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInitialization()
    }

    private func commonInitialization() {
        dataSource = self
        register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: CollectionViewCellReuseIdentifier
        )
    }


    var performBatchUpdatesTestMethodCalled = false
    dynamic override func performBatchUpdates(
        _ updates: NullaryVoidClosure?,
        completion: ((Bool) -> Void)? = nil
        ) {

        performBatchUpdatesTestMethodCalled = true

        super.performBatchUpdates(updates, completion: completion)
    }

    var reloadDataTestMethodCalled = false
    dynamic override func reloadData() {
        reloadDataTestMethodCalled = true
    }

    var reloadSectionsTestMethodCalled = false
    dynamic override func reloadSections(_ sections: IndexSet) {
        reloadSectionsTestMethodCalled = true
    }

    var reloadItemsTestMethodCalled = false
    dynamic override func reloadItems(at items: [IndexPath]) {
        reloadItemsTestMethodCalled = true
    }

}


extension TestCollectionView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt path: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: CollectionViewCellReuseIdentifier, for: path)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return itemCountsBySection.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCountsBySection[section]
    }

}
