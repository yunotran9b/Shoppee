//
//  ServiceCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/26/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class ServiceCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = colView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Service
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

          return CGSize(width: collectionView.frame.height/2, height: collectionView.frame.height/2)

      }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }
  

  @IBOutlet weak var InfoView: UIView!
  @IBOutlet weak var CellView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
    
    
    colView.delegate = self
    colView.dataSource = self
        setup()
    }
  
  func setup(){
    addSubview(colView)
    CellView.backgroundColor = UIColor(named: "FuckinLightGray")
    
    colView.backgroundColor = UIColor.clear
    colView.topAnchor.constraint(equalTo: InfoView.bottomAnchor, constant: 10).isActive = true
    colView.leftAnchor.constraint(equalTo: CellView.leftAnchor).isActive = true
    colView.rightAnchor.constraint(equalTo: CellView.rightAnchor).isActive = true
    colView.bottomAnchor.constraint(equalTo: CellView.bottomAnchor).isActive = true
    
    InfoView.layer.shadowColor = UIColor.black.cgColor
    InfoView.layer.shadowOpacity = 0.5
    InfoView.layer.shadowOffset = .zero
    InfoView.layer.shadowRadius = 5
    InfoView.layer.cornerRadius = 3
  }
  
  let colView : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 4,
        minimumInteritemSpacing: 2,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    )
    columnLayout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "Service", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Cell")
    return cv
  }()

}
