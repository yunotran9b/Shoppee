//
//  ViewController.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/24/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//
import ESPullToRefresh
import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  var arr = ["Basic Operators"]
  var CollectionHeight : CGFloat = 0.0
  var tmp : CGFloat = 0.0
  var flag = 0
  
  @IBOutlet weak var SearchBar: SearchBar!
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == colView{
    return 6
    } else {
      return 20
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == colView{
    switch indexPath.row {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as! SlideCell
      cell.backgroundColor = .blue
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as! ServiceCell
      return cell
    case 2:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlashSaleCell", for: indexPath) as! FlashSaleCell
      return cell
    case 3:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchMostCell", for: indexPath) as! SearchMostCell
      return cell
    case 4:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MallCell", for: indexPath) as! MallCell
      return cell
    case 5:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestCell", for: indexPath) as! SuggestCell
      cell.configure(with: self.arr)
      return cell
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
      return cell
    }
    } else {
      let cell = colView1.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
      cell.backgroundColor = .orange
      return cell
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == colView {
    switch indexPath.row {
    case 0:
      return CGSize(width: view.frame.width, height: view.frame.width / 2)
    case 1:
      return CGSize(width: view.frame.width, height: view.frame.width * 3 / 4 + 15)
    case 2:
      return CGSize(width: view.frame.width, height: view.frame.width / 2 + 20)
    case 3:
      return CGSize(width: view.frame.width, height: view.frame.width / 2 + 20)
    case 4:
      return CGSize(width: view.frame.width, height: view.frame.width / 1.125)
    case 5:
      if flag == 0 || flag == 1 {
        tmp = CollectionHeight
      } else {
        tmp = tmp + (view.frame.width / 1.71) * 5
      }
      flag += 1
      return CGSize(width: view.frame.width, height: tmp)
    default:
      return CGSize(width: view.frame.width, height: view.frame.width / 2)
    }
    } else {
      return CGSize(width: collectionView.frame.height / 1.5, height: collectionView.frame.height / 1.1)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    colView.backgroundColor = UIColor(named: "VeryLightGray")
    
    colView.delegate = self
    colView.dataSource = self
    
    colView1.dataSource = self
    colView1.delegate = self

    addSubview()
    setupElements()
    CollectionHeight = view.frame.width / 1.05
    
  }
  
  func addSubview(){
    view.backgroundColor = UIColor(named: "MainTone")
    view.insertSubview(colView, at: 0)
    view.addSubview(colView1)
  }
  
  func setupElements(){
    
      colView1.topAnchor.constraint(equalTo: SearchBar.bottomAnchor).isActive = true
      colView1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      colView1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    colView1.heightAnchor.constraint(equalToConstant: view.frame.height / 7.5).isActive = true
      colView1.backgroundColor = UIColor(named: "VeryLightGray")
    
    colView1.isHidden = true
    colView1.showsHorizontalScrollIndicator = false
    
    SearchBar.backgroundColor = UIColor(white: 1, alpha: 0)
    
    colView.frame = view.frame
    // Top Pull
    colView.es.addPullToRefresh {
      [unowned self] in
      /// Do anything you want...
      /// ...
      /// Stop refresh when your job finished, it will reset refresh footer if completion is true
      self.colView.es.stopPullToRefresh()
      /// Set ignore footer or not
      self.colView.es.stopPullToRefresh()
    }
    
    // Bottom Pull
    colView.es.addInfiniteScrolling {
      [unowned self] in
      /// Do anything you want...
      for _ in 1...10 {
      self.arr.append("abc")
      }
      self.colView.reloadData()
      /// If common end
      self.colView.es.stopLoadingMore()
      /// If no more data
      //self.colView.es.noticeNoMoreData()
    }
  }
  
  let colView : UICollectionView = {
    let columnLayout = ColumnFlowLayout(
      cellsPerRow: 1,
      minimumInteritemSpacing: 10,
      minimumLineSpacing: 10,
      sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    )
    let cv = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
    cv.collectionViewLayout = columnLayout
    cv.contentInsetAdjustmentBehavior = .never
    cv.translatesAutoresizingMaskIntoConstraints = false
    let cellNib = UINib(nibName: "ServiceCell", bundle: nil)
    cv.register(cellNib, forCellWithReuseIdentifier: "ServiceCell")
    cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    cv.register(SlideCell.self, forCellWithReuseIdentifier: "SlideCell")
    cv.register(UINib(nibName: "FlashSaleCell", bundle: nil), forCellWithReuseIdentifier: "FlashSaleCell")
    cv.register(UINib(nibName: "SearchMostCell", bundle: nil), forCellWithReuseIdentifier: "SearchMostCell")
    cv.register(UINib(nibName: "MallCell", bundle: nil), forCellWithReuseIdentifier: "MallCell")
    cv.register(UINib(nibName: "SuggestCell", bundle: nil), forCellWithReuseIdentifier: "SuggestCell")
    return cv
  }()
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.contentOffset.y != 0 {
    var offset = scrollView.contentOffset.y / (view.frame.height / 4.5)

    if offset > 7.5 && view.frame.height > 670{
      colView1.heightAnchor.constraint(equalToConstant: view.frame.height / 10).isActive = true
      colView1.isHidden = false
    } else if offset <= 7.5 && view.frame.height > 670 {
      colView1.isHidden = true
    }
    if offset > 9 && view.frame.height < 670{
      colView1.isHidden = false
    } else if offset <= 9 && view.frame.height < 670 {
      colView1.isHidden = true
    }
    if offset > 1 {
        offset = 1
    }
    SearchBar.backgroundColor = UIColor(white: 1, alpha: offset)
    if offset <= 0.2 {
      SearchBar.Picked.tintColor = UIColor(white: 1, alpha: 1 - offset * 3)
      SearchBar.Mess.tintColor = UIColor(white: 1, alpha: 1 - offset * 3)
    } else {
      SearchBar.Picked.tintColor = UIColor(named: "MainTone")?.withAlphaComponent(offset)
    SearchBar.Mess.tintColor = UIColor(named: "MainTone")?.withAlphaComponent(offset)
    }
    }
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
}


