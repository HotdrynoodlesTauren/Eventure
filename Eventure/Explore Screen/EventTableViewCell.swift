//
//  EventTableViewCell.swift
//  Eventure
//


import UIKit

class EventTableViewCell: UITableViewCell {
    static let identifier = "EventTableViewCell"

    private let eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    func configure(with event: Event) {
        eventNameLabel.text = event.name
        eventDescriptionLabel.text = event.description
        if let imageUrl = event.imageUrl {
            setImage(from: imageUrl)
        } else {
            eventImageView.image = nil
        }
    }

        
        private func setImage(from url: URL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                   
                    let image = UIImage(data: data)
                    self?.eventImageView.image = image
                }
            }.resume()
        }

    private let eventNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private let eventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(eventImageView)
        contentView.addSubview(eventNameLabel)
        contentView.addSubview(eventDescriptionLabel)
        applyConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func applyConstraints() {
        eventImageView.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        eventDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Constraints for eventImageView
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            eventImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            eventImageView.heightAnchor.constraint(equalToConstant: 60),
            eventImageView.widthAnchor.constraint(equalToConstant: 60),

            // Constraints for eventNameLabel
            eventNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            eventNameLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 10),
            eventNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // Constraints for eventDescriptionLabel
            eventDescriptionLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5),
            eventDescriptionLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 10),
            eventDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            eventDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

 
}
