//
//  ShortTermEventsViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/18/23.
//

import UIKit

class ShortTermEventsViewController: UIViewController {

    let shortTermEventsScreen = ShortTermEventsView()
    let exploreScreen = ExploreView()

    override func loadView() {
        view = exploreScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(shortTermEventsScreen)
        view.backgroundColor = .white
//        title = "Short Term Events"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the frame for the first view
        shortTermEventsScreen.frame = view.bounds
    }
}
