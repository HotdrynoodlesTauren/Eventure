

import UIKit
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    let registerView = RegisterView()
    let childProgressView = ProgressSpinnerViewController()
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = registerView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    @objc func onRegisterTapped(){
        registerNewAccount()
    }
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)}
}


extension RegisterViewController{
    
    func registerNewAccount(){
       
        if let name = registerView.userName.text,
           let email = registerView.textFieldLogin.text,
           let password = registerView.textFieldPassword.text,
           let repeatPassword = registerView.textfieldPasswordCheck.text
        
        {
            if name.isEmpty{
                showAlert(message: "Input A User Name")
                return
            }
            if password.isEmpty || password.count < 6 {
                showAlert(message: "Input A Valid Password, at least 6 characters/numbers")
                return
            }
            if !isValidEmail(email) {
                showAlert(message: "Invalid Email Address")
                return}
            
            if password != repeatPassword{
                showAlert(message: "Password doesn't match, try again!")
                return
            }
        
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.showAlert(message: "Error occurred during registration: \(error.localizedDescription)")
                } else if let user = authResult?.user {
                    
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                    
                  
                    self.addUserToFirestore(uid: user.uid, email: email, name: name)
                    self.notificationCenter.post(name: .userRegistered, object: ["name":user.displayName, "uid":user.uid])
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }}
        
        func addUserToFirestore(uid: String, email: String, name: String) {
          
            let db = Firestore.firestore()
            
        
            let userData: [String: Any] = [
                "uid": uid,
                "name": name,
                "email": email
            ]
            
        
            db.collection("users").document(uid).setData(userData) { error in
                if let error = error {
                    print("Error adding user to Firestore: \(error)")
                    self.showAlert(message: "Error adding user to Firestore.")
                } else {
                    print("User added to Firestore with UID: \(uid)")
                }
            }
        }
        
    func isValidEmail(_ email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                
                self.hideActivityIndicator()
                
                self.navigationController?.popViewController(animated: true)
            }else{
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}


extension RegisterViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
