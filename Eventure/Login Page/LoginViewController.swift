import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    let loginScreen = CustomLoginView()
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser: FirebaseAuth.User?
    let database = Firestore.firestore()
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = loginScreen
        navigationItem.hidesBackButton = true
        loginScreen.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        loginScreen.buttonLogin.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
        handleAuth = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            if user == nil {
                self.currentUser = nil
            } else {
                self.currentUser = user
            
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }


    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.showAlert(message: "Error signing in: \(error.localizedDescription)")
            } else if let user = authResult?.user {
                DispatchQueue.main.async {
//                    let profileViewController = profileViewController()  修改这里转到mainscreen
//                    self.navigationController?.pushViewController(profileViewController, animated: true)
                    self.notificationCenter.post(name: .userLoggedin, object: ["name":user.displayName, "uid":user.uid])
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }


    @objc func onRegisterTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }

    @objc func onLoginTapped() {
        guard let email = loginScreen.textFieldLogin.text,
              let password = loginScreen.textFieldPassword.text,
              !email.isEmpty, !password.isEmpty else {
            showAlert(message: "Please enter both email and password.")
            return
        }
        signIn(email: email, password: password)
    }


    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

