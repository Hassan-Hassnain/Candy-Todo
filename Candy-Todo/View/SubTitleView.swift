//
//  SubTitleView.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit

class SubTitleView: UIView {


    let XIB_NAME = SubTitleView.className   //add NSObject extension
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    @IBOutlet var contentView: UIView!  // connect parent UIView
   
    var firstTitle: String {
        get{firstTitleLabel.text ?? ""}
        set{firstTitleLabel.text = newValue}
    }
     
    var secondTitle: String {
        get{secondTitleLabel.text ?? ""}
        set{secondTitleLabel.text = newValue}
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
    
    
    
    func setSubTitle(first: String, second: String) {
        firstTitle = first
        secondTitle = second
    }
}

