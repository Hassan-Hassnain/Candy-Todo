//
//  EditProfileVC.swift
//  Candy-Todo
//
//  Created by اسرارالحق  on 30/10/2020.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        tableView.regCell(cellName: TextFieldTableCell.className)
    }
    
    @IBAction func helpButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension EditProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableCell.className) as? TextFieldTableCell else { return UITableViewCell() }
        cell.configure(title: K.DummyUser.title, placeHolder: K.DummyUser.placeHolder, rightIcon: nil)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
