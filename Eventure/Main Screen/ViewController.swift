//
//  ViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/16/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    let defaults = UserDefaults.standard
//    let mainScreen = MainScreenView()
    let notificationCenter = NotificationCenter.default
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up red tab bar...
        let tabExplore = UINavigationController(rootViewController: LongTermEventsViewController())
        let tabExploreBarItem = UITabBarItem(
            title: "Explore",
            image: .none,
            tag: 0
//            image: UIImage(systemName: "r.square")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(systemName: "r.square.fill")
        )
        tabExplore.tabBarItem = tabExploreBarItem
//        tabExplore.navigationItem.title = "Explore Events Near You"
//        tabExplore.title = "Red"
        
        //MARK: setting up green tab bar...
//        let tabPostEvent = UINavigationController(rootViewController: UploadEventScreenController())
//        let tabPostEventBarItem = UITabBarItem(
//            title: "Post A Event",
//            image: .none,
//            tag: 0
////            image: UIImage(systemName: "g.square")?.withRenderingMode(.alwaysOriginal),
////            selectedImage: UIImage(systemName: "g.square.fill")
//        )
//        tabPostEvent.tabBarItem = tabPostEventBarItem
////        tabExplore.navigationItem.title = "Your Connections"
////        tabConnections.title = "Green"
        
        //MARK: setting up blue tab bar...
        let tabMyProfile = UINavigationController(rootViewController: MyProfileViewController())
        let tabMyProfileBarItem = UITabBarItem(
            title: "MyProfile",
            image: .none,
            tag: 0
//            image: UIImage(systemName: "b.square")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(systemName: "b.square.fill")
        )
        tabMyProfile.tabBarItem = tabMyProfileBarItem
//        tabExplore.navigationItem.title = "My Profile"
//        tabMyProfile.title = "Blue"
        
        //MARK: setting up this view controller as the Tab Bar Controller...
//        self.viewControllers = [tabExplore, tabPostEvent, tabMyProfile]
        self.viewControllers = [tabExplore, tabMyProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLoginStatus()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", image: .none, target: self, action: #selector(onButtonLogoutTapped))
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForUserLoggedin), name: .userLoggedin, object: nil)
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForUserRegistered), name: .userRegistered, object: nil)
    }

    func checkLoginStatus(){
        let existUser = defaults.object(forKey: "userName") as! String?
        if existUser != nil {
            
        } else {
            let loginController = LoginViewController()
            navigationController?.pushViewController(loginController, animated: true)
        }
    }
    
    @objc func notificationReceivedForUserLoggedin(notification: Notification){
        let user = notification.object as! NSDictionary
        defaults.set(user["name"], forKey: "userName")
        defaults.set(user["uid"], forKey: "userId")
//        self.getUserProfile(token: apiKey)
//        self.getAllNotes(token: apiKey)
    }
    
    @objc func notificationReceivedForUserRegistered(notification: Notification){
        let user = notification.object as! NSDictionary
        defaults.set(user["name"], forKey: "userName")
        defaults.set(user["uid"], forKey: "userId")
//        self.getUserProfile(token: apiKey)
//        self.getAllNotes(token: apiKey)
    }

}

