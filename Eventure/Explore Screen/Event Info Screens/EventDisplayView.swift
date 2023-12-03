//
//  EventDisplayView.swift
//  Eventure
//
//  Created by Yi Zhou on 12/2/23.
//

import UIKit

class EventDisplayView: UIView {

    var imageEvent:UIImageView!
    let items = ["Event Detail", "Event Reviews"]
    var segmentedControl:UISegmentedControl!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupImageEvent()
        setupSegmentedControl()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageEvent(){
        imageEvent = UIImageView()
        imageEvent.image = UIImage(systemName: "person.fill")
        imageEvent.contentMode = .scaleToFill
        imageEvent.clipsToBounds = true
        imageEvent.layer.cornerRadius = 10
        imageEvent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageEvent)
    }
    
    func setupSegmentedControl(){
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(segmentedControl)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageEvent.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageEvent.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageEvent.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageEvent.heightAnchor.constraint(equalToConstant: 150),
            
            segmentedControl.topAnchor.constraint(equalTo: imageEvent.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
//            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

}
