//
//  SearchBar.swift
//  Shoppee
//
//  Created by Trần Nhất Thống on 5/24/20.
//  Copyright © 2020 Trần Nhất Thống. All rights reserved.
//
import UIKit

@IBDesignable
class SearchBar: UIView {
    
    var contentView : UIView?
    
  @IBOutlet weak var SearchView: UIView!
  @IBOutlet weak var SearchTextField: UITextField!
  override func awakeFromNib() {
        super.awakeFromNib()
    setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    func setup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
      
      SearchView.layer.cornerRadius = 5
      
      SearchTextField.attributedPlaceholder = NSAttributedString(string: "iPhone, iPad", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainTone")!])
      SearchTextField.isEnabled = false
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SearchBar", bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
}
