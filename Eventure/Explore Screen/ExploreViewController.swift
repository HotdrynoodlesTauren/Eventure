//
//  ExploreViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/17/23.
//

import UIKit

class ExploreViewController: UIViewController {

    let exploreScreen = ExploreView()
    var longTermEventsViewController: LongTermEventsViewController!
    var shortTermEventsViewController: ShortTermEventsViewController!
    
    //MARK: Top tap bar
    let segmentedControl = {
        let items = ["Long Term Events", "Short Term Events"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(ExploreViewController.self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    override func loadView() {
        view = exploreScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the segmented control to the view
        view.addSubview(segmentedControl)
//        longTermEventsViewController = LongTermEventsViewController()
//        shortTermEventsViewController = ShortTermEventsViewController()
//        
//        // Set Long Term Events ViewController by default
//        addChild(longTermEventsViewController)
//        view.addSubview(longTermEventsViewController.view)
//        longTermEventsViewController.didMove(toParent: self)
        
        view.backgroundColor = .white
//        title = "Explore Events Near You"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the frame for the segmented control
        segmentedControl.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 30)
    }
        
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Handle segmented control value change
        let selectedIndex = sender.selectedSegmentIndex
        if selectedIndex == 0 {
            // Switch to the first view
            view.backgroundColor = UIColor.green
//            switchToChildViewController(longTermEventsViewController)
        } else {
            // Switch to the second view
            view.backgroundColor = UIColor.yellow
//            switchToChildViewController(shortTermEventsViewController)
        }
    }
    
    func switchToChildViewController(_ childViewController: UIViewController) {
        // Remove the currently displayed child view controller
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        
        // Add the new child view controller
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
}
