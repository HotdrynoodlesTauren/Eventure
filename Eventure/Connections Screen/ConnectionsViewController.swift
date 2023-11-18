//
//  ConnetionsViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/17/23.
//

import UIKit

class ConnectionsViewController: UIViewController {

    let connectionsScreen = ConnectionsView()

    override func loadView() {
        view = connectionsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        title = "Your Connections"
    }

}
