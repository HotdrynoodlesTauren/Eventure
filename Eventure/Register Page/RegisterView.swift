

import UIKit

class RegisterView: UIView {

    var labelName: UILabel!
    var userName:UITextField!
    var textFieldLogin: UITextField!
    var textFieldPassword: UITextField!
    var buttonRegister: UIButton!
    var backgroundImageView: UIImageView!
    var textfieldPasswordCheck: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundImageView()
        setupLabelName()
        setupTextFieldLogin()
        setupTextFieldPassword()
        setupButtonRegister()
        setupTextFieldPasswordCheck()
        setupUsername()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUsername() {
        userName = UITextField()
        userName.placeholder = "Username"
        userName.borderStyle = .roundedRect
        userName.layer.cornerRadius = 12
        userName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userName)
    }
    
    
    func setupBackgroundImageView() {
        backgroundImageView = UIImageView(frame: bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "bg.jpg") 
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImageView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "REGISTER PAGE"
        labelName.font = UIFont(name: "Avenir-Medium", size: 30)
        labelName.textColor = UIColor.darkGray
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelName)
    }
    
    func setupTextFieldLogin() {
        textFieldLogin = UITextField()
        textFieldLogin.placeholder = "Email"
        textFieldLogin.borderStyle = .roundedRect
        textFieldLogin.layer.cornerRadius = 12
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textFieldLogin)
    }
    
    
    func setupTextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.layer.cornerRadius = 12
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textFieldPassword)
    }
    func setupTextFieldPasswordCheck() {
        textfieldPasswordCheck = UITextField()
        textfieldPasswordCheck.placeholder = "Repeat Password"
        textfieldPasswordCheck.borderStyle = .roundedRect
        textfieldPasswordCheck.layer.cornerRadius = 12
        textfieldPasswordCheck.isSecureTextEntry = true
        textfieldPasswordCheck.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textfieldPasswordCheck)
    }
    
    
    func setupButtonRegister() {
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.setTitleColor(.systemBackground, for: .normal)
        buttonRegister.backgroundColor = UIColor.lightGray
        buttonRegister.layer.cornerRadius = 10
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonRegister)
        
        buttonRegister.layer.shadowColor = UIColor.gray.cgColor
        buttonRegister.layer.shadowOffset = CGSize(width: 0, height: 2)
        buttonRegister.layer.shadowRadius = 4
        buttonRegister.layer.shadowOpacity = 0.8
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            labelName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 200),
            userName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            userName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            textFieldLogin.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 250),
            textFieldLogin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textFieldLogin.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldLogin.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 50),
            textFieldPassword.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            textfieldPasswordCheck.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 100),
            textfieldPasswordCheck.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textfieldPasswordCheck.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textfieldPasswordCheck.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
           
            
            buttonRegister.topAnchor.constraint(equalTo: textfieldPasswordCheck.bottomAnchor, constant: 16),
            buttonRegister.leadingAnchor.constraint(equalTo: textfieldPasswordCheck.leadingAnchor),
            buttonRegister.widthAnchor.constraint(equalTo: textfieldPasswordCheck.widthAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

}
