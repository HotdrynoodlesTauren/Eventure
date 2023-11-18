//
//  ExploreViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/17/23.
//

import UIKit

class ExploreViewController: UIViewController {

    let mainScreen = MainScreenView()

    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explore Events Near You"
    }

}
