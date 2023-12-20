
import UIKit

class ProfileView: UIView {
    
    var profileImageView: UIImageView!
    var cameraButton: UIButton!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var refreshButton: UIButton!
    var backgroundImageView: UIImageView!
    var tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewPostCell.self, forCellReuseIdentifier: TableViewPostCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupBackgroundImageView()
        sendSubviewToBack(backgroundImageView)
           setupProfileImageView()
           setupCameraButton()
        setupRefreshButton()
           setupLabels()
        self.addSubview(tableView)
           initConstraints()
        
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundImageView() {
        backgroundImageView = UIImageView(frame: bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "bg.jpg")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.alpha = 1.0 // Set alpha to 1 for no transparency
        addSubview(backgroundImageView)
    }

    
    func setupRefreshButton() {
            refreshButton = UIButton(type: .system)
            refreshButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal) // Using SF Symbols for a refresh icon
            refreshButton.tintColor = .white
            refreshButton.translatesAutoresizingMaskIntoConstraints = false
            addSubview(refreshButton)
        }
    func configureRefreshButtonAction(target: Any?, action: Selector) {
        refreshButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func configureCameraButtonAction(target: Any?, action: Selector) {
        cameraButton.addTarget(target, action: action, for: .touchUpInside)
    }


    func setupProfileImageView() {
        profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
    }
    
    func setupCameraButton() {
        cameraButton = UIButton(type: .system)
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .white
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cameraButton)
    }
    
    func setupLabels() {
        nameLabel = UILabel()
        
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.text = "User@example.com"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)

        emailLabel = UILabel()
        emailLabel.text = "User@example.com"
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailLabel)
    }
    
  
    
    func initConstraints() {
        NSLayoutConstraint.activate(
            [
                backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
               
                profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
                profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                profileImageView.widthAnchor.constraint(equalToConstant: 100),
                profileImageView.heightAnchor.constraint(equalToConstant: 100),

                tableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
                               tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                               tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
                tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                        
                cameraButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
                cameraButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
                cameraButton.widthAnchor.constraint(equalToConstant: 30),
                cameraButton.heightAnchor.constraint(equalToConstant: 30),

                nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
                nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10),

                emailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
                emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

            
                refreshButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                                refreshButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                refreshButton.widthAnchor.constraint(equalToConstant: 30),
                                refreshButton.heightAnchor.constraint(equalToConstant: 30),
                
                backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
                        backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                        backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                        
            ]
        )
      
    }
}

