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
    lazy var segmentedControl = {
        let items = ["Long Term Events", "Short Term Events"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    override func loadView() {
        view = exploreScreen
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        exploreScreen.backgroundColor = UIColor.clear
    
            setupSegmentedControl()
            setupInitialChildViewController()
        // Set the background image
        let backgroundImage = UIImage(named: "Img 1")
            let backgroundImageView = UIImageView(frame: view.bounds)
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(backgroundImageView, at: 0)
        }

        private func setupSegmentedControl() {
            view.addSubview(segmentedControl)
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                segmentedControl.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    private func setupInitialChildViewController() {
            longTermEventsViewController = LongTermEventsViewController()
            shortTermEventsViewController = ShortTermEventsViewController()

            addChild(longTermEventsViewController)
            view.addSubview(longTermEventsViewController.view)
            setupConstraintsForChildViewController(longTermEventsViewController.view)
            longTermEventsViewController.didMove(toParent: self)
        }

        private func setupConstraintsForChildViewController(_ childView: UIView) {
            childView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                childView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
                childView.leftAnchor.constraint(equalTo: view.leftAnchor),
                childView.rightAnchor.constraint(equalTo: view.rightAnchor),
                childView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let newChildViewController = sender.selectedSegmentIndex == 0 ? longTermEventsViewController! : shortTermEventsViewController!
        switchToChildViewController(newChildViewController)
    }

        func switchToChildViewController(_ childViewController: UIViewController) {
            if let currentChild = children.first {
                currentChild.willMove(toParent: nil)
                currentChild.view.removeFromSuperview()
                currentChild.removeFromParent()
            }

            addChild(childViewController)
            view.addSubview(childViewController.view)
            setupConstraintsForChildViewController(childViewController.view)
            childViewController.didMove(toParent: self)
        }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the frame for the segmented control
        segmentedControl.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 30)
    }
}
