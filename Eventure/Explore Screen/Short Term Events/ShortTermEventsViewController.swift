//
//  ShortTermEventsViewController.swift
//  Eventure
//
//  Created by Yi Zhou on 11/18/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class ShortTermEventsViewController: UIViewController {
    
    var shortTermEventsView: ShortTermEventsView!
    
    override func loadView() {
        super.loadView()
        shortTermEventsView = ShortTermEventsView()
        view = shortTermEventsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                    if let event = Event(documentData: document.data(), id: document.documentID) {
                        fetchedEvents.append(event)
                        
                    }
                }
                DispatchQueue.main.async {
                    self?.shortTermEventsView.events = fetchedEvents
                }
            }
        }
    }

}
