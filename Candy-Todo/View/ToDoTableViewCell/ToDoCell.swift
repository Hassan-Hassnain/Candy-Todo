//
//  ToDoCell.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 29/10/2020.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var todoTitle: UILabel!
    
    var checkMark: UIImage? {
        get{checkMarkImageView.image}
        set{checkMarkImageView.image = newValue}
    }
    
    var title: String {
        get{todoTitle.text ?? ""}
        set{todoTitle.text = newValue}
    }
    
    var isThisCellChecked: Handle_BoolArg?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        checkMarkImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageViewTapped(){
        
        switch parentViewController {
        case is NotificationVC:
            checkMark = checkMark == nil ? K.alertMark : nil
        default:
            checkMark = checkMark == nil ? K.checkMark : nil
        }
        
        let state = checkMark != nil ? true : false
        isThisCellChecked?(state)
    }
    
    fileprivate func setupUI() {
        checkMarkImageView.layer.cornerRadius = 5
        checkMarkImageView.addBorder(toSide: .all, withColor: UIColor.cyan.cgColor, andThickness: 1.0)
    }
    
}
