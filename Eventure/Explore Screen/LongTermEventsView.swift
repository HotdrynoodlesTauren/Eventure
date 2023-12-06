
import UIKit

class LongTermEventsView: UIView {
    
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Long Term Events"
        label.textAlignment = .center
        //label.textColor = UIColor(white) // Light blue color
        label.font = UIFont.boldSystemFont(ofSize: 24) // System bold font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    var tableView: UITableView = {
        let table = UITableView()
        table.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.blue, for: .normal)
        // button.layer.cornerRadius = 25 // Adjust for desired circular shape
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.blue.cgColor // Or any other color
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(tableView)
        self.addSubview(addButton)
        
        initConstraints()
        setupAddButtonConstraints()
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
    private func setupAddButtonConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10), // Closer to the top
            addButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20), // Align to the right
            addButton.widthAnchor.constraint(equalToConstant: 50), // Width of the button
            addButton.heightAnchor.constraint(equalToConstant: 50) // Height of the button
        ])
        
        
    }}
