import UIKit
import FirebaseAuth
import FirebaseFirestore

class LongTermEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var shouldReloadData = true
    var longTermEventsView: LongTermEventsView!
    var events: [Event] = []
    

    override func loadView() {
        super.loadView()
        longTermEventsView = LongTermEventsView()
        view = longTermEventsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupTableView()
        longTermEventsView.addButton.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        fetchDataIfNeeded()
    }


        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchDataIfNeeded()
        }

        func fetchDataIfNeeded() {
            if shouldReloadData {
             
                fetchEventsFromFirebase()
                shouldReloadData = false
            }
        }

        @objc func onButtonAddTapped(){
            let updateVC = UploadEventScreenController()
            self.navigationController?.pushViewController(updateVC, animated: true)
            shouldReloadData = true
        }
    

    private func setupBackgroundImage() {
        let backgroundImage = UIImage(named: "Img 1")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(backgroundImageView, at: 0)
    }

    private func setupTableView() {
        longTermEventsView.tableView.dataSource = self
        longTermEventsView.tableView.delegate = self
        longTermEventsView.tableView.allowsSelection = true
        longTermEventsView.tableView.isUserInteractionEnabled = true
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
                }
                DispatchQueue.main.async {
                    self?.events = fetchedEvents
                    self?.longTermEventsView.tableView.reloadData()
                }
            }
        }
    }

    // UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as! EventTableViewCell
        cell.configure(with: events[indexPath.row])
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        
        let eventDisplayViewController = EventDisplayViewController()
        eventDisplayViewController.eventToDisplay = event
        // Assuming EventDisplayViewController has these properties
        navigationController?.pushViewController(eventDisplayViewController, animated: true)
    }
}
