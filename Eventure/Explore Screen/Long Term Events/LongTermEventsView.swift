//
//  LongTermEvents.swift
//  Eventure
//
//  Created by Yi Zhou on 11/18/23.
//

import UIKit

class LongTermEventsView: UIView {
    
    var labelTest:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabelTest()
        initConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLabelTest(){
        labelTest = UILabel()
        labelTest.text = "Test text for Long Term Events"
        labelTest.font = .boldSystemFont(ofSize: 20)
        labelTest.textAlignment = .center
        labelTest.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTest)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelTest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            labelTest.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
}
