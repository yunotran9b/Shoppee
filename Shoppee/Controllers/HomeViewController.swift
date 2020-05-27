//
//  ViewController.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/24/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.row {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as! SlideCell
      cell.backgroundColor = .blue
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
      return cell
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
      return cell
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.row {
    case 1:
      return CGSize(width: view.frame.width, height: view.frame.width * 3 / 4 + 15)
    default:
      return CGSize(width: view.frame.width, height: view.frame.width / 2)
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    colView.backgroundColor = UIColor(named: "VeryLightGray")
    
    colView.delegate = self
    colView.dataSource = self
    
    addSubview()
    setupElements()
  }
  
  func addSubview(){
    view.insertSubview(colView, at: 0)
  }
  
  func setupElements(){
    colView.frame = view.frame
  }
  
  let colView : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 1,
      minimumInteritemSpacing: 10,
      minimumLineSpacing: 10,
      sectionInset: UIEdgeInsets(top: -20, left: 0, bottom: 1, right: 0)
    )
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    let cellNib = UINib(nibName: "ServiceCell", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "ServiceCell")
    cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    cv.register(SlideCell.self, forCellWithReuseIdentifier: "SlideCell")
    return cv
  }()
  
  
}

