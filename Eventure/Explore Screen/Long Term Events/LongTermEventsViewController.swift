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
                    self?.longTermEventsView.events = fetchedEvents
                }
            }
        }
    }

}
