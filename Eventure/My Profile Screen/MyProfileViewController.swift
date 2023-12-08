//
//  MyProfileViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/17/23.
//

import UIKit

class MyProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var profileImageView: UIImageView!
    var cameraButton: UIButton!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var backgroundImageView: UIImageView!
    var tableView: UITableView!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "bg.jpg")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)

        setupProfileImageView()
        setupCameraButton()
        setupLabels()
        setupTableView()

        initConstraints()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", image: .none, target: self, action: #selector(onButtonLogoutTapped))
    }
    
    @objc func onButtonLogoutTapped(){
        defaults.set(nil, forKey: "userName")
        let loginController = LoginViewController()
        loginController.hidesBottomBarWhenPushed = true
        navigationController?.popViewController(animated: false)
        navigationController?.pushViewController(loginController, animated: true)
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
        view.addSubview(profileImageView)
    }

   
    func setupCameraButton() {
        cameraButton = UIButton(type: .system)
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        cameraButton.tintColor = .white
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraButton)

       
        cameraButton.addTarget(self, action: #selector(cameraButtonTapped), for: .touchUpInside)
        
       
        cameraButton.layer.shadowColor = UIColor.gray.cgColor
        cameraButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        cameraButton.layer.shadowRadius = 4
        cameraButton.layer.shadowOpacity = 0.8
    }

 
    func setupLabels() {
        nameLabel = UILabel()
        nameLabel.text = "User Name"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        emailLabel = UILabel()
        emailLabel.text = "User@example.com"
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
    }



    func setupTableView() {
            tableView = UITableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(TableViewCell.self, forCellReuseIdentifier: "PostCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tableView)
        }
   

    func initConstraints() {
        NSLayoutConstraint.activate(
            [
               
                profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                profileImageView.widthAnchor.constraint(equalToConstant: 100),
                profileImageView.heightAnchor.constraint(equalToConstant: 100),

               
                cameraButton.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
                cameraButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
                cameraButton.widthAnchor.constraint(equalToConstant: 30),
                cameraButton.heightAnchor.constraint(equalToConstant: 30),

                nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
                nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 10),

                emailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
                emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),

                tableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }



    @objc func cameraButtonTapped() {
        print("Camera button tapped")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! TableViewCell
        cell.postImageView.image = UIImage(systemName: "photo")
        cell.labelPostName.text = "Sample Post Title"
        cell.labelPostContent.text = "This is an example content for the post."
        return cell
    }


}
