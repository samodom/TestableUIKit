//
//  TestingCollectionView.swift
//  TestableUIKit
//
//  Created by Sam Odom on 12/3/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

let CollectionViewCellReuseIdentifier = "CollectionViewCellReuseIdentifier"

class TestingCollectionView: UICollectionView {

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
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCellReuseIdentifier)
    }

}


extension TestingCollectionView: UICollectionViewDataSource {

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
