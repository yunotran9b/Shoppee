//
//  Mall.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/28/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class Mall: UICollectionViewCell {

  @IBOutlet weak var ImageView: UIImageView!
  @IBOutlet weak var Brand: UIImageView!
  @IBOutlet weak var Tittle: UILabel!
  @IBOutlet weak var Border: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    Border.layer.cornerRadius = 15
    Border.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    Border.layer.borderWidth = 1.0
    Border.layer.shadowColor = UIColor.darkGray.cgColor
    Border.layer.shadowRadius = 1.0
    Border.layer.shadowOpacity = 0.1
    Border.layer.masksToBounds = false
    }

}
