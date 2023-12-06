import UIKit

class CustomLoginView: UIView {
    
    var labelName: UILabel!
    var textFieldLogin: UITextField!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    var buttonRegister: UIButton!
    var backgroundImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundImageView()
        setupLabelName()
        setupTextFieldLogin()
        setupTextFieldPassword()
        setupButtonLogin()
        setupButtonRegister()
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundImageView() {
        backgroundImageView = UIImageView(frame: bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "bg.jpg") // Update the image name
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImageView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Eventure"
        labelName.font = UIFont(name: "Avenir-Medium", size: 60)
        labelName.textColor = UIColor.darkGray
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelName)
    }
    
    func setupTextFieldLogin() {
        textFieldLogin = UITextField()
        textFieldLogin.placeholder = "Username"
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
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(.systemBackground, for: .normal)
        buttonLogin.backgroundColor = UIColor.lightGray
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonLogin)
        
        buttonLogin.layer.shadowColor = UIColor.gray.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width: 0, height: 2)
        buttonLogin.layer.shadowRadius = 4
        buttonLogin.layer.shadowOpacity = 0.8
        
        buttonLogin.layer.borderWidth = 1
        buttonLogin.layer.borderColor = UIColor.lightGray.cgColor
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
            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            labelName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            textFieldLogin.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 250),
            textFieldLogin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textFieldLogin.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldLogin.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 16),
            textFieldPassword.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            buttonLogin.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 16),
            buttonRegister.leadingAnchor.constraint(equalTo: buttonLogin.leadingAnchor),
            buttonRegister.widthAnchor.constraint(equalTo: buttonLogin.widthAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

