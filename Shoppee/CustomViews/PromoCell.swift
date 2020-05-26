//
//  PromoCell.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/24/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//

import UIKit


class PromoCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  @IBOutlet weak var CoinView: UIView!
  @IBOutlet weak var CellView: UIView!
  
  var contentCell : UICollectionViewCell?
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
  cell.backgroundColor = .blue
    return cell
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    print("abc")
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    print("abc")
    contentCell?.prepareForInterfaceBuilder()
  }
  
  func loadViewFromNib() -> UIView? {
      let bundle = Bundle(for: type(of: self))
      let nib = UINib(nibName: "PromoCell", bundle: bundle)
    print("abc:")
      return nib.instantiate(
          withOwner: self,
          options: nil).first as? UICollectionViewCell
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  func setup(){
    
    colView.delegate = self
    colView.dataSource = self
    
    addSubview()
    setupElements()
  }
  func addSubview() {
    addSubview(colView)
  }
  
  func setupElements(){
    colView.topAnchor.constraint(equalTo: CoinView.bottomAnchor).isActive = true
    colView.leftAnchor.constraint(equalTo: CellView.leftAnchor).isActive = true
    colView.rightAnchor.constraint(equalTo: CellView.rightAnchor).isActive = true
    colView.bottomAnchor.constraint(equalTo: CellView.bottomAnchor).isActive = true
    colView.frame = self.frame
  }
  let colView : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 1,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0)
    )
    columnLayout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .always
    cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    return cv
  }()

}
