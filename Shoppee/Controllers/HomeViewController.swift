//
//  ViewController.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/24/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromoCell", for: indexPath) as! PromoCell
      cell.backgroundColor = .orange
    return cell
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
    cv.register(PromoCell.self, forCellWithReuseIdentifier: "PromoCell")
    return cv
  }()

}

