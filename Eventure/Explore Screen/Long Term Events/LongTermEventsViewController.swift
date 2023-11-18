//
//  LongTermEventsViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/18/23.
//

import UIKit

class LongTermEventsViewController: UIViewController {

    let longTermEventsScreen = LongTermEventsView()
    let exploreScreen = ExploreView()

    override func loadView() {
        view = exploreScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(longTermEventsScreen)
        view.backgroundColor = .white
//        title = "Long Term Events"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the frame for the first view
        longTermEventsScreen.frame = view.bounds
    }
}
