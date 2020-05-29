//
//  SearchMostCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/28/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class SearchMostCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    2
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.height/1.5, height: collectionView.frame.height * 0.9)

  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = colView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SearchMost
    cell.ImageView.image = UIImage(named: String(format: "flshimg%d", indexPath.row + 1))
    switch indexPath.row {
    case 0:
      cell.Tittle.text = "Ti vi, tủ lạnh, đồ gia dụng"
      cell.Sold.text = "Đã bán 508"
    case 1:
      cell.Tittle.text = "Đồ cho thú cưng"
      cell.Sold.text = "Đã bán 64"
    default: break
    }
    
    return cell

  }
  

  @IBOutlet weak var TittleView: UIImageView!
  @IBOutlet weak var SearchMostView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
  
  func setup(){
    colView.dataSource = self
    colView.delegate = self
    
    addSubview(colView)
  
    colView.topAnchor.constraint(equalTo: TittleView.bottomAnchor).isActive = true
    colView.leftAnchor.constraint(equalTo: SearchMostView.leftAnchor).isActive = true
    colView.rightAnchor.constraint(equalTo: SearchMostView.rightAnchor).isActive = true
    colView.bottomAnchor.constraint(equalTo: SearchMostView.bottomAnchor).isActive = true
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
    let cellNib = UINib(nibName: "SearchMost", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Cell")
    return cv
  }()

}
