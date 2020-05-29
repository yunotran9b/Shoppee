//
//  FlashSale.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/28/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class FlashSale: UICollectionViewCell {
  
  @IBOutlet weak var ImageView: UIImageView!
  @IBOutlet weak var Tittle: UILabel!
  @IBOutlet weak var ProgressView: UIProgressView!
  override func awakeFromNib() {
        super.awakeFromNib()
    setup()
    }
  
  func setup(){
    ProgressView.layer.cornerRadius = 5
   ProgressView .clipsToBounds = true

    // Set the rounded edge for the inner bar
    ProgressView.layer.sublayers![1].cornerRadius = 5
    ProgressView.subviews[1].clipsToBounds = true
  }

}

