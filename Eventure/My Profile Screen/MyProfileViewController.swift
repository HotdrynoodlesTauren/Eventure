//
//  MyProfileViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/17/23.
//

import UIKit

class MyProfileViewController: UIViewController {

    let myProfileScreen = MyProfileView()

    override func loadView() {
        view = myProfileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = "My Profile"
    }

}
