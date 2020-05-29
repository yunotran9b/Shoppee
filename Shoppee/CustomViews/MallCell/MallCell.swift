//
//  MallCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/28/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class MallCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == colView1{
      return 3
    } else {
      return 10
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == colView1{
      let cell = colView1.dequeueReusableCell(withReuseIdentifier: "Insurance", for: indexPath) as! Insurance
      return cell
    } else {
      let cell = colView2.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Mall
      cell.ImageView.image = UIImage(named: String(format: "flshimg%d", indexPath.row))
      cell.Brand.image = UIImage(named: "Airpay")
      return cell
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colView1{
    return CGSize(width: collectionView.frame.width / 2.75, height: collectionView.frame.height)
          } else {
          return CGSize(width: collectionView.frame.width / 2.75, height: collectionView.frame.height * 0.9)
          }
  }
  

  @IBOutlet weak var CellView: UIView!
  @IBOutlet weak var SeperatureLine: UIImageView!
  @IBOutlet weak var PromoImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
      setup()
    }
  
  func setup(){
    addSubview(colView1)
    addSubview(colView2)
    
    colView1.backgroundColor = .white
    colView2.backgroundColor = .white
    
    colView1.showsHorizontalScrollIndicator = false
    
    colView1.dataSource = self
    colView1.delegate = self
    
    colView2.dataSource = self
    colView2.delegate = self
    
    colView1.topAnchor.constraint(equalTo: SeperatureLine.bottomAnchor).isActive = true
    colView1.bottomAnchor.constraint(equalTo: PromoImage.topAnchor).isActive = true
    colView1.leftAnchor.constraint(equalTo: CellView.leftAnchor).isActive = true
    colView1.rightAnchor.constraint(equalTo: CellView.rightAnchor).isActive = true
    
    colView2.topAnchor.constraint(equalTo: PromoImage.bottomAnchor).isActive = true
    colView2.bottomAnchor.constraint(equalTo: CellView.bottomAnchor).isActive = true
    colView2.leftAnchor.constraint(equalTo: CellView.leftAnchor).isActive = true
    colView2.rightAnchor.constraint(equalTo: CellView.rightAnchor).isActive = true
  }
  
  let colView1 : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 3,
        minimumInteritemSpacing: 2,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    )
    columnLayout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "Insurance", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Insurance")
    return cv
  }()
  let colView2 : UICollectionView = {
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
    let cellNib = UINib(nibName: "Mall", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Cell")
    return cv
  }()

}
