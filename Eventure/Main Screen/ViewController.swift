//
//  ViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/16/23.
//

import UIKit

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
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
        let tabConnections = UINavigationController(rootViewController: ConnectionsViewController())
        let tabConnectionsBarItem = UITabBarItem(
            title: "Connections",
            image: .none,
            tag: 0
//            image: UIImage(systemName: "g.square")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(systemName: "g.square.fill")
        )
        tabConnections.tabBarItem = tabConnectionsBarItem
//        tabExplore.navigationItem.title = "Your Connections"
//        tabConnections.title = "Green"
        
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
        self.viewControllers = [tabExplore, tabConnections, tabMyProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

