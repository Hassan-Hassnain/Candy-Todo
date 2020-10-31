
import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: AuthTextField!
    @IBOutlet weak var passwordTextField: AuthTextField!
    
    var email: String {
        get{emailTextField.text ?? K.emptyString}
        set{emailTextField.text = newValue}
    }
    
    var password: String {
        get{passwordTextField.text ?? K.emptyString}
        set{passwordTextField.text = newValue}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        print(email)
        print(password)
        navigationController?.pushViewController(TodaysListVC.initVC(), animated: true)
    }
    
    @IBAction func forgotButtonTapped(_ sender: Any) {
        print("Forgot password button tapped")
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
//        navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: RegisterVC.className))!, animated: true)
        navigationController?.pushViewController(RegisterVC.initVC(), animated: true)
    }
    
}



