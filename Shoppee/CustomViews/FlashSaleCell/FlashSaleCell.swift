//
//  FlashSaleCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/28/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit
import CountdownLabel

class FlashSaleCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = colView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FlashSale
    cell.ImageView.image = UIImage(named: String(format: "flshimg%d", indexPath.row + 1))
    switch indexPath.row {
    case 0:
      cell.Tittle.text = "đ3.370.000"
    case 1:
      cell.Tittle.text = "đ200.000"
    default: break
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.height/1.5, height: collectionView.frame.height * 0.9)

  }

  @IBOutlet weak var FlashSaleView: UIView!
  @IBOutlet weak var ClockView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
    setup()
    
    }
  
  func setup(){
    colView.dataSource = self
    colView.delegate = self
    
    addSubview(colView)
    
    let countdownLabel = CountdownLabel(frame: frame, minutes: 900) // you can use NSDate as well
    countdownLabel.animationType = .Evaporate
    countdownLabel.start()
    countdownLabel.translatesAutoresizingMaskIntoConstraints = false
    ClockView.addSubview(countdownLabel)
    countdownLabel.topAnchor.constraint(equalTo: ClockView.topAnchor).isActive = true
    countdownLabel.leftAnchor.constraint(equalTo: ClockView.leftAnchor).isActive = true
    countdownLabel.rightAnchor.constraint(equalTo: ClockView.rightAnchor).isActive = true
    countdownLabel.bottomAnchor.constraint(equalTo: ClockView.bottomAnchor).isActive = true
    
    colView.topAnchor.constraint(equalTo: ClockView.bottomAnchor).isActive = true
    colView.leftAnchor.constraint(equalTo: FlashSaleView.leftAnchor).isActive = true
    colView.rightAnchor.constraint(equalTo: FlashSaleView.rightAnchor).isActive = true
    colView.bottomAnchor.constraint(equalTo: FlashSaleView.bottomAnchor).isActive = true
    colView.backgroundColor = .white
    
    
    
  }
  
  let colView : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 3,
        minimumInteritemSpacing: 2,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    )
    columnLayout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "FlashSale", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Cell")
    return cv
  }()
  

}
