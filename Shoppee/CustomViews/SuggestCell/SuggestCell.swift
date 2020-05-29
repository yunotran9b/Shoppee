//
//  SuggestCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/29/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class SuggestCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var arr = [String]()
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == colView1{
      return 20
    } else {
      return self.arr.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == colView1{
    let cell = colView1.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
    cell.backgroundColor = .orange
    return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Suggest", for: indexPath) as! Suggest
      cell.backgroundColor = .orange
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == colView1 {
    return CGSize(width: collectionView.frame.height / 1.5, height: collectionView.frame.height / 1.1)
    } else {
      return CGSize(width: collectionView.frame.width / 2.15, height: collectionView.frame.width / 1.75)
    }
  }
  
  @IBOutlet weak var SuggestView: UIView!
  @IBOutlet weak var Label: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
  
  func setup(){
    
    colView1.dataSource = self
    colView1.delegate = self
    
    colView2.dataSource = self
    colView2.delegate = self
    
    addSubview(colView1)
    addSubview(colView2)
  
    colView1.topAnchor.constraint(equalTo: Label.bottomAnchor).isActive = true
    colView1.leftAnchor.constraint(equalTo: SuggestView.leftAnchor).isActive = true
    colView1.rightAnchor.constraint(equalTo: SuggestView.rightAnchor).isActive = true
    colView1.heightAnchor.constraint(equalToConstant: Label.frame.height * 3).isActive = true
    colView1.backgroundColor = UIColor(named: "VeryLightGray")
    
    colView2.topAnchor.constraint(equalTo: colView1.bottomAnchor).isActive = true
    colView2.leftAnchor.constraint(equalTo: SuggestView.leftAnchor).isActive = true
    colView2.rightAnchor.constraint(equalTo: SuggestView.rightAnchor).isActive = true
    colView2.bottomAnchor.constraint(equalTo: SuggestView.bottomAnchor).isActive = true
    colView2.backgroundColor = UIColor(named: "VeryLightGray")
    colView2.isScrollEnabled = false
    
  }
  
  func configure(with arr: [String]) {
      self.arr = arr
      self.colView2.reloadData()
      self.colView2.layoutIfNeeded()
  }
  
  let colView1 : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 5,
        minimumInteritemSpacing: 2,
        minimumLineSpacing: 5,
        sectionInset: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
    )
    columnLayout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "MenuCell", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "MenuCell")
    return cv
  }()
  
  let colView2 : DynamicHeightCollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 2,
      minimumInteritemSpacing: 5,
        minimumLineSpacing: 5,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    )
    columnLayout.scrollDirection = .vertical
    let cv = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "Suggest", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "Suggest")
    return cv
  }()
}
