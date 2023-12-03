//
//  EventDisplayViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 12/2/23.
//

import UIKit

class EventDisplayViewController: UIViewController {

    let eventDisplayScreen = EventDisplayView()
    var eventToDisplay:Event!
    var reviewsToDisplay:[Review]!
    var segmentedControl:UISegmentedControl!
    //MARK: initiate 2 child controller
    var eventDetailViewController: EventDetailViewController!
    var eventReviewsViewController: EventReviewsViewController!
    
    override func loadView(){
        view = eventDisplayScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Test"
        
        eventToDisplay = Event(eventName: "Chrismas Tree in SF", eventId: "123456789", userId: "987654321", image: "https://goldengatehotel.com/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2022/07/1-3.jpeg.webp", timeSpan: "12/01/2023 - 01/03/2024", timeOpening: "6:00pm - 3:00am", phoneNumber: "(333) 444-5555", address: "123 Main St, San Francisco, CA", website: "www.google.com", description: "Union Square’s Macy’s Christmas tree is one of the most recognizable ones in the entire Bay Area. The red and gold decorations and glowing red star are iconic, and it’s impossible to miss at 83 feet tall. While you’re there, be sure to check out the ice rink, which is hosting plenty of fun skating events throughout the holiday season.", reviews: reviewsToDisplay)
        reviewsToDisplay = [Review]()
        reviewsToDisplay.append(Review(userName: "SF local", userId: "3216549876", images: "https://www.sftourismtips.com/images/pier-39-christmas-tree-lighting-at-night.jpg", reviewContent: "This is a great event, So much to do in this area! We stayed at a hotel just about a block from Union Square and it was the best location to explore the city from the center. Tons of brand shopping stores in this area and restaurants within walking distance. There is also an ice skating rink that opened up late November and Christmas decor was up at this time we visited. I felt safe walking around this area both in the daytime and at night since it is mostly a tourist area."))
        reviewsToDisplay.append(Review())
        
        segmentedControl = eventDisplayScreen.segmentedControl
        //MARK: set the default child controller to the eventDetailViewController
        setupInitialChildViewController()
        //MARK: set the behavior when different tab was tapped
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        
    }
    
    //MARK: set the default child controller to the eventDetailViewController
    func setupInitialChildViewController() {
        eventDetailViewController = EventDetailViewController()
        eventReviewsViewController = EventReviewsViewController()

        self.addChild(eventDetailViewController)
        eventDetailViewController.receivedEvent = eventToDisplay
        eventDetailViewController.receivedReviews = reviewsToDisplay
        
        view.addSubview(eventDetailViewController.view)
        setupConstraintsForChildViewController(eventDetailViewController.view)
        eventDetailViewController.didMove(toParent: self)
        
    }
    
    //MARK: set the behavior when different tab was tapped
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let newChildViewController = sender.selectedSegmentIndex == 0 ? eventDetailViewController : eventReviewsViewController
        if let childViewController = newChildViewController{
            switchToChildViewController(childViewController)
            childViewController.receivedEvent = eventToDisplay
        }
    }
    
    //MARK: helper function to set Child View
    private func setupConstraintsForChildViewController(_ childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            childView.leftAnchor.constraint(equalTo: view.leftAnchor),
            childView.rightAnchor.constraint(equalTo: view.rightAnchor),
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: helper function to set behaviors when switching between tabs
    func switchToChildViewController(_ childViewController: EventInfoViewController) {
        // Remove the currently displayed child view controller
        if let currentChild = children.first {
            currentChild.willMove(toParent: nil)
            currentChild.view.removeFromSuperview()
            currentChild.removeFromParent()
        }
        // Add the new child view controller
        addChild(childViewController)
        childViewController.receivedEvent = eventToDisplay
        childViewController.receivedReviews = reviewsToDisplay
        
        view.addSubview(childViewController.view)
        setupConstraintsForChildViewController(childViewController.view)
        childViewController.didMove(toParent: self)
    }

}
