//
//  EventReviewsViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit
import FirebaseFirestore

class EventReviewsViewController: EventInfoViewController {
    
    let eventReviewsScreen = EventReviewsView()
    var firestore: Firestore! // Firestore reference
    
    override func loadView(){
        view = eventReviewsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firestore = Firestore.firestore()
        loadReviews()
        
        eventReviewsScreen.tableViewReviews.delegate = self
        eventReviewsScreen.tableViewReviews.dataSource = self
        
        
        //MARK: remove the line between tableViews
        eventReviewsScreen.tableViewReviews.separatorStyle = .none
        eventReviewsScreen.buttonWriteAReviews.addTarget(self, action:#selector(writeAReview), for: .touchUpInside)
    }

    func loadReviews(){
        let eventIdToSearch = receivedEvent.eventId // Replace with the eventId you're looking for
        
        // Reference to the Firestore collection
        let reviewsCollection = firestore.collection("Reviews")
        
        // Query to search for documents with a specific eventId
        reviewsCollection.whereField("eventId", isEqualTo: eventIdToSearch as Any).getDocuments { (querySnapshot, error) in
            if let error = error {
                // Handle the error
                print("Error getting documents: \(error)")
            } else {
                // Iterate through the documents that match the query
                for document in querySnapshot!.documents {
                    // Access the data of each document
                    let data = document.data()
                    if let imageString = data["images"] as? String, let imageUrl = URL(string: imageString){
                        if imageUrl.host?.contains("firebasestorage.googleapis.com") == true {
                            // Download image from Firebase Storage
                            self.downloadImage(from: imageUrl ) { downloadedImage in
                                DispatchQueue.main.async {
                                    let eventImage = downloadedImage
                                    let review = Review(userName: data["userName"] as? String, userId: data["userId"] as? String, eventId: data["eventId"] as? String, images: eventImage, reviewContent: data["reviewContent"] as? String)
                                    self.receivedReviews.append(review)

                                    self.eventReviewsScreen.tableViewReviews.reloadData()
                                }
                                
                            }
                        }else {
                            // Load image directly (assuming it's a direct URL to an image)
//                            let review = Review(userName: data["userName"] as? String, userId: data["userId"] as? String, eventId: data["eventId"] as? String, images: imageUrl, reviewContent: data["reviewContent"] as? String)
//                            print("Document data: \(review)")
//                            self.receivedReviews.append(review)
                        }
                    }
                }
            }
        }
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
            
    @objc func writeAReview(){
        let eventWriteAReviewController = EventWriteAReviewViewController()
        eventWriteAReviewController.receivedEventId = self.receivedEvent.eventId
        navigationController?.pushViewController(eventWriteAReviewController, animated: true)
    }
    
    
}

extension EventReviewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let uwReceivedReviews = receivedReviews{
            return uwReceivedReviews.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviews", for: indexPath) as! ReviewsTableViewCell
//        if let rating = receivedReviews[indexPath.row].rating{
//            cell.labelRating.text = String(rating)
//        }
        if let reviewContent = receivedReviews[indexPath.row].reviewContent{
            cell.textViewReview.text = reviewContent
        }
        if let uwImage = receivedReviews[indexPath.row].images{
            cell.imageReview.image = uwImage
        }
        if let uwUser = receivedReviews[indexPath.row].userName{
            cell.labelReview.text = uwUser
        }
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
