//
//  EventReviewsViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventReviewsViewController: UIViewController {
    var receivedEvent:Event!
    var receivedReviews:[Review]!
    let eventReviewsScreen = EventReviewsView()
//    var row:Int!
    
    override func loadView(){
        view = eventReviewsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventReviewsScreen.tableViewReviews.delegate = self
        eventReviewsScreen.tableViewReviews.dataSource = self
        
        
        //MARK: remove the line between tableViews
        eventReviewsScreen.tableViewReviews.separatorStyle = .none
        print("EventReviewsViewController")
        print(receivedReviews!)
        if let eventName = receivedEvent.eventName{
            if !eventName.isEmpty{
                title = eventName
            }
        }
        
        eventReviewsScreen.buttonWriteAReviews.addTarget(self, action:#selector(writeAReview), for: .touchUpInside)
    }

    @objc func writeAReview(){
        let eventWriteAReviewController = EventWriteAReviewViewController()

        navigationController?.pushViewController(eventWriteAReviewController, animated: true)
    }
}

extension EventReviewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\n")
        print("whyyyyyyyyyy")
        print("extension")
        print(receivedReviews!)
        return receivedReviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\n")
        print("22222whyyyyyyyyyy")
        print("22222extension")
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviews", for: indexPath) as! ReviewsTableViewCell
        if let rating = receivedReviews[indexPath.row].rating{
            cell.labelRating.text = String(rating)
        }
        if let reviewContent = receivedReviews[indexPath.row].reviewContent{
            cell.textViewReview.text = reviewContent
        }
//        if let phoneNumber = receivedReviews[indexPath.row].phoneNumber, let phoneType = contacts[indexPath.row].phoneType{
//            cell.labelPhone.text = "\(phoneNumber) (\(phoneType))"
//        }
//
//        if let uwImage = contacts[indexPath.row].profile{
//            cell.imageProfile.image = uwImage
//        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let review = receivedReviews[indexPath.row]
//        let displayContactViewController = DisplayContactViewController()
//        displayContactViewController.receivedContact = contact
//        displayContactViewController.row = indexPath.row
//        displayContactViewController.delegate = self
//        navigationController?.pushViewController(displayContactViewController, animated: true)
//    }
    
}
