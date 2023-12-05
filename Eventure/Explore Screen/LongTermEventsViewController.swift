//
//  LongTermEventsViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/18/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class LongTermEventsViewController: UIViewController {
    
    var longTermEventsView: LongTermEventsView!
    
    override func loadView() {
        super.loadView()
        longTermEventsView = LongTermEventsView()
        view = longTermEventsView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "Img 1")
            let backgroundImageView = UIImageView(frame: view.bounds)
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(backgroundImageView, at: 0)
        fetchEventsFromFirebase()
    }
    
    func fetchEventsFromFirebase() {
        let db = Firestore.firestore()
        db.collection("Longterm Events").getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                var fetchedEvents: [Event] = []
                for document in querySnapshot!.documents {
                    
                    let event = Event(documentData: document.data(), eventId: document.documentID)
                    fetchedEvents.append(event)
                    
                    
//                    do {
//                        if let event = try Event(documentData: document.data() as! Decoder, eventId: document.documentID) {
//                            fetchedEvents.append(event)
//                        }
//                    } catch {
//                        // Handle the error here
//                        print("Error creating Event: \(error)")
//                    }
                }
                DispatchQueue.main.async {
                    self?.longTermEventsView.events = fetchedEvents
                }
            }
        }
    }

}
