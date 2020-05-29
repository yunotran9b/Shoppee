//
//  SlideCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/27/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit
import ImageSlideshow

class SlideCell: UICollectionViewCell {
  
  let slideshow = ImageSlideshow()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  func setup(){
    slideshow.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(slideshow)
    
    slideshow.setImageInputs([
      ImageSource(image: UIImage(named: "img1")!),
      ImageSource(image: UIImage(named: "img2")!),
      ImageSource(image: UIImage(named: "img3")!),
      ImageSource(image: UIImage(named: "img4")!)
    ])
    
    slideshow.contentScaleMode = .scaleAspectFill
    
    slideshow.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    slideshow.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    slideshow.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    slideshow.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
  }
}
