
import UIKit

class LongTermEventsView: UIView, UITableViewDataSource, UITableViewDelegate {
    var events: [Event] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Long Term Events"
        label.textAlignment = .center
        //label.textColor = UIColor(white) // Light blue color
        label.font = UIFont.boldSystemFont(ofSize: 24) // System bold font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    private let tableView: UITableView = {
        let table = UITableView()
        table.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        initConstraints()
      
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5) 
        ])
    }

    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as! EventTableViewCell
        cell.configure(with: events[indexPath.row])
        return cell
    }

    // UITableViewDelegate methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let eventDisplayViewController = EventDisplayViewController()
        eventDisplayViewController.eventToDisplay = event
        eventDisplayViewController.reviewsToDisplay = event.reviews
        navigationController?.pushViewController(eventDisplayViewController, animated: true)
    }
}
