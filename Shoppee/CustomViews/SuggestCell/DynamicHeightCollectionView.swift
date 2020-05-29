//
//  DynamicCollectionView.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/29/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

