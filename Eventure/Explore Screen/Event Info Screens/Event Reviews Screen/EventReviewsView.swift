//
//  EventReviewssView.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventReviewsView: UIView {

    var labelPreviousVisitors:UILabel!
    var buttonWriteAReviews:UIButton!
    var tableViewReviews:UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupLabelPreviousVisitors()
        setupButtonWriteAReviews()
        setupTableViewReviews()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelPreviousVisitors(){
        labelPreviousVisitors = UILabel()
        labelPreviousVisitors.text = "People who has been here:"
        labelPreviousVisitors.textAlignment = .center
        labelPreviousVisitors.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPreviousVisitors)
    }
    
    func setupButtonWriteAReviews(){
        buttonWriteAReviews = UIButton(type: .system)
        buttonWriteAReviews.setTitle("Write A Review", for: .normal)
//        buttonWriteAReviews.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonWriteAReviews.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonWriteAReviews)
    }

    func setupTableViewReviews(){
        tableViewReviews = UITableView()
        tableViewReviews.register(ReviewsTableViewCell.self, forCellReuseIdentifier: "reviews")
        tableViewReviews.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewReviews)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelPreviousVisitors.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelPreviousVisitors.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            buttonWriteAReviews.topAnchor.constraint(equalTo: labelPreviousVisitors.topAnchor),
//            buttonWriteAReviews.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonWriteAReviews.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            tableViewReviews.topAnchor.constraint(equalTo: labelPreviousVisitors.bottomAnchor, constant: 10),
            tableViewReviews.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableViewReviews.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableViewReviews.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
