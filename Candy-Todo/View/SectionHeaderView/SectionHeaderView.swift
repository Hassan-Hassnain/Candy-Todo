//
//  SectionHeaderView.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit

class SectionHeaderView: UIView {
    
    let XIB_NAME = SectionHeaderView.className   //add NSObject extension
    
    @IBOutlet var contentView: UIView!  // connect parent UIView
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerTextLabel: UILabel!
    
    var headerText: String {
        get{headerTextLabel.text ?? K.emptyString}
        set{headerTextLabel.text = newValue}
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self) //add fixInView UIView extension
    }
    
    func setLeadingConstructing(value: CGFloat) {
        leadingConstraint.constant = value
    }
    
}
