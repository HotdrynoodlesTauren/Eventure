//
//  EventDetailView.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventDetailView: UIView {

//    var labelEventName:UILabel!
    var imageTimeSpan:UIImageView!
    var labelTimeSpan:UILabel!
    var imageAddress:UIImageView!
    var labelAddress:UILabel!
    var imageTimeOpening:UIImageView!
    var labelTimeOpening:UILabel!
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
        
        setupImageTimeSpan()
        setupLabelTimeSpan()
        setupImageAddress()
        setupLabelAddress()
        setupImageTimeOpening()
        setupLabelTimeOpening()
        setupImageWebsite()
        setupLabelWebsite()
        setupImagePhone()
        setupLabelPhone()
        setupLabelDescription()
        setupTextViewDescription()
        
//        setupLabelStreet()
//        setupLabelCityState()
//        setupLabelZip()

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
    
    func setupImageTimeSpan(){
        imageTimeSpan = UIImageView()
        imageTimeSpan.image = UIImage(systemName: "calendar.circle.fill")
        imageTimeSpan.contentMode = .scaleAspectFit
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
        imageAddress.contentMode = .scaleAspectFit
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
    
    func setupImageTimeOpening(){
        imageTimeOpening = UIImageView()
        imageTimeOpening.image = UIImage(systemName: "clock.fill")
        imageTimeOpening.contentMode = .scaleAspectFit
        imageTimeOpening.clipsToBounds = true
        imageTimeOpening.layer.cornerRadius = 10
        imageTimeOpening.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageTimeOpening)
    }
    
    func setupLabelTimeOpening(){
        labelTimeOpening = UILabel()
        labelTimeOpening.text = "Time Opening:"
        labelTimeOpening.textAlignment = .center
        labelTimeOpening.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTimeOpening)
    }
    
    func setupImageWebsite(){
        imageWebsite = UIImageView()
        imageWebsite.image = UIImage(systemName: "globe.americas.fill")
        imageWebsite.contentMode = .scaleAspectFit
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
        imagePhone.contentMode = .scaleAspectFit
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
            imageTimeSpan.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageTimeSpan.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageTimeSpan.heightAnchor.constraint(equalToConstant: 15),
            
            labelTimeSpan.topAnchor.constraint(equalTo: imageTimeSpan.topAnchor),
            labelTimeSpan.leadingAnchor.constraint(equalTo: imageTimeSpan.trailingAnchor, constant: 10),
            
            imageAddress.topAnchor.constraint(equalTo: labelTimeSpan.bottomAnchor, constant: 20),
            imageAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageAddress.heightAnchor.constraint(equalToConstant: 15),
            
            labelAddress.topAnchor.constraint(equalTo: imageAddress.topAnchor),
            labelAddress.leadingAnchor.constraint(equalTo: imageAddress.trailingAnchor, constant: 10),
            
            imageTimeOpening.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 20),
            imageTimeOpening.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            imageTimeOpening.heightAnchor.constraint(equalToConstant: 15),
            
            labelTimeOpening.topAnchor.constraint(equalTo: imageTimeOpening.topAnchor),
            labelTimeOpening.leadingAnchor.constraint(equalTo: imageTimeOpening.trailingAnchor, constant: 10),
            
            imageWebsite.topAnchor.constraint(equalTo: labelTimeOpening.bottomAnchor, constant: 20),
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
