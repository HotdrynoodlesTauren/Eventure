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
    let notificationCenter = NotificationCenter.default
    
    //MARK: initiate 2 child controller
    var eventDetailViewController: EventDetailViewController!
    var eventReviewsViewController: EventReviewsViewController!
    
    override func loadView(){
        view = eventDisplayScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Test"
        reviewsToDisplay = [Review]()
        
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForReviewAdded), name: .reviewAdded, object: nil)
        
        segmentedControl = eventDisplayScreen.segmentedControl
        //MARK: set the default child controller to the eventDetailViewController
        setupInitialChildViewController()
        //MARK: set the behavior when different tab was tapped
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        if let eventName = eventToDisplay.eventName{
            if !eventName.isEmpty{
                print(eventName)
                title = eventName
            }
        }
        
        if let imageUrl = eventToDisplay.imageUrl {
            setImage(from: imageUrl)
        } else {
            self.eventDisplayScreen.imageEvent.image = nil
        }
    }
    private func setImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async { [weak self] in
               
                let image = UIImage(data: data)
                self?.eventDisplayScreen.imageEvent.image = image
            }
        }.resume()
    }
    
    @objc func notificationReceivedForReviewAdded(notification: Notification){
        let newReview = notification.object as! Review
        print(newReview)
//        reviewsToDisplay.append(newReview)
        print(reviewsToDisplay!)
        if let currentChild = children.first {
            print("111111")
            if let currentChildViewController = currentChild as? EventReviewsViewController {
                print("222222")
                currentChildViewController.receivedReviews.append(newReview)
                currentChildViewController.eventReviewsScreen.tableViewReviews.reloadData()
            }
        }
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
