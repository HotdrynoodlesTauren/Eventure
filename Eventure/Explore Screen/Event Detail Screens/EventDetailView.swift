//
//  EventDetailView.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventDetailView: UIView {

    var imageEvent:UIImageView!
//    var labelEventName:UILabel!
    var imageTimeSpan:UIImageView!
    var labelTimeSpan:UILabel!
    var imageAddress:UIImageView!
    var labelAddress:UILabel!
    var imageWebsite:UIImageView!
    var labelWebsite:UILabel!
    var imagePhone:UIImageView!
    var labelPhone:UILabel!
    var labelDescription:UILabel!
    var textViewDescription:UITextView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
//        setupLabelEventName()
        
        setupImageEvent()
        setupImageTimeSpan()
        setupLabelTimeSpan()
        setupImageAddress()
        setupLabelAddress()
        setupImageWebsite()
        setupLabelWebsite()
        setupImagePhone()
        setupLabelPhone()
        setupLabelDescription()
        setupTextViewDescription()
        
//        setupLabelStreet()
//        setupLabelCityState()
//        setupLabelZip()
//        
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupLabelEventName(){
//        labelEventName = UILabel()
//        labelEventName.font = UIFont.boldSystemFont(ofSize: 20)
//        labelEventName.textAlignment = .center
//        labelEventName.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(labelEventName)
//    }
    
    func setupImageEvent(){
        imageEvent = UIImageView()
        imageEvent.image = UIImage(systemName: "camera.fill")
        imageEvent.contentMode = .scaleToFill
        imageEvent.clipsToBounds = true
        imageEvent.layer.cornerRadius = 10
        imageEvent.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageEvent)
    }
    
    func setupImageTimeSpan(){
        imageTimeSpan = UIImageView()
        imageTimeSpan.image = UIImage(systemName: "calendar.circle.fill")
        imageTimeSpan.contentMode = .scaleToFill
        imageTimeSpan.clipsToBounds = true
        imageTimeSpan.layer.cornerRadius = 10
        imageTimeSpan.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageTimeSpan)
    }
    
    func setupLabelTimeSpan(){
        labelTimeSpan = UILabel()
        labelTimeSpan.textAlignment = .center
        labelTimeSpan.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTimeSpan)
    }
    
    func setupImageAddress(){
        imageAddress = UIImageView()
        imageAddress.image = UIImage(systemName: "mappin.circle.fill")
        imageAddress.contentMode = .scaleToFill
        imageAddress.clipsToBounds = true
        imageAddress.layer.cornerRadius = 10
        imageAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageAddress)
    }
    
    func setupLabelAddress(){
        labelAddress = UILabel()
        labelAddress.text = "Address:"
        labelAddress.textAlignment = .center
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupImageWebsite(){
        imageWebsite = UIImageView()
        imageWebsite.image = UIImage(systemName: "globe.americas.fill")
        imageWebsite.contentMode = .scaleToFill
        imageWebsite.clipsToBounds = true
        imageWebsite.layer.cornerRadius = 10
        imageWebsite.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageWebsite)
    }
    
    func setupLabelWebsite(){
        labelWebsite = UILabel()
        labelWebsite.textAlignment = .center
        labelWebsite.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelWebsite)
    }
    
    func setupImagePhone(){
        imagePhone = UIImageView()
        imagePhone.image = UIImage(systemName: "phone.circle.fill")
        imagePhone.contentMode = .scaleToFill
        imagePhone.clipsToBounds = true
        imagePhone.layer.cornerRadius = 10
        imagePhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhone)
    }
    
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.textAlignment = .center
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setupLabelDescription(){
        labelDescription = UILabel()
        labelDescription.text = "Description"
        labelDescription.textAlignment = .center
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelDescription)
    }
    
    func setupTextViewDescription(){
        textViewDescription = UITextView()
        textViewDescription.font = UIFont.systemFont(ofSize: 16)
        textViewDescription.allowsEditingTextAttributes = false
        textViewDescription.textAlignment = .left
        textViewDescription.isEditable = false
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textViewDescription)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageEvent.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageEvent.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageEvent.heightAnchor.constraint(equalToConstant: 150),
            imageEvent.widthAnchor.constraint(equalToConstant: 150),
            
            imageTimeSpan.topAnchor.constraint(equalTo: imageEvent.bottomAnchor, constant: 20),
            imageTimeSpan.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageTimeSpan.heightAnchor.constraint(equalToConstant: 15),
            
            labelTimeSpan.topAnchor.constraint(equalTo: imageTimeSpan.topAnchor),
            labelTimeSpan.leadingAnchor.constraint(equalTo: imageTimeSpan.trailingAnchor, constant: 10),
            
            imageAddress.topAnchor.constraint(equalTo: labelTimeSpan.bottomAnchor, constant: 20),
            imageAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageAddress.heightAnchor.constraint(equalToConstant: 15),
            
            labelAddress.topAnchor.constraint(equalTo: imageAddress.topAnchor),
            labelAddress.leadingAnchor.constraint(equalTo: imageAddress.trailingAnchor, constant: 10),
            
            imageWebsite.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 20),
            imageWebsite.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageWebsite.heightAnchor.constraint(equalToConstant: 15),
            
            labelWebsite.topAnchor.constraint(equalTo: imageWebsite.topAnchor),
            labelWebsite.leadingAnchor.constraint(equalTo: imageWebsite.trailingAnchor, constant: 10),
            
            imagePhone.topAnchor.constraint(equalTo: labelWebsite.bottomAnchor, constant: 20),
            imagePhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imagePhone.heightAnchor.constraint(equalToConstant: 15),
            
            labelPhone.topAnchor.constraint(equalTo: imagePhone.topAnchor),
            labelPhone.leadingAnchor.constraint(equalTo: imagePhone.trailingAnchor, constant: 10),
            
            labelDescription.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 20),
            labelDescription.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            textViewDescription.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 16),
            textViewDescription.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            textViewDescription.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textViewDescription.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
}
