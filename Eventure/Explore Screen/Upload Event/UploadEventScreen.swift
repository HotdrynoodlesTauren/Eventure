//
//  UploadEventScreen.swift
//  Eventure
//
//  Created by Qin on 2023-12-03.
//

import UIKit

class UploadEventScreen: UIView {
    var contentView: UIView!
        var contentWrapper:UIScrollView!
    
        var textFieldName: UITextField!
        var textFieldWebsite: UITextField!
    var textFieldPhone: UITextField!
    var textFieldTimeSpan: UITextField!
    var textFieldTimeOpening: UITextField!
        var textFieldAddress: UITextField!
    var textFieldDescription: UITextField!
    var buttonTakePhoto: UIButton!
    

        var buttonSave: UIButton!

        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .white
            setupContentWrapper()
            
            setuptextFieldName()
            setuptextFieldWebsite()
            setuptextFieldPhone()
            setuptextFieldTimeSpan()
            setuptextFieldTimeOpening()
            setuptextFieldAddress()
            setuptextFieldDescription()
            setupbuttonTakePhoto()
            
            setupbuttonSave()
            initConstraints()
        }
        
    //    methods to initialize the UI elements...
        
        func setupContentWrapper(){
            contentWrapper = UIScrollView()
            contentWrapper.backgroundColor = .white
            contentWrapper.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(contentWrapper)
            
            contentView = UIView()  // Initialize the contentView
                    contentView.translatesAutoresizingMaskIntoConstraints = false
                    contentWrapper.addSubview(contentView)
                    
                    // Set constraints for contentView
                    NSLayoutConstraint.activate([
                        contentView.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
                        contentView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
                        contentView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
                        contentView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
                        contentView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor)
                    ])
            }
        func setuptextFieldName(){
            textFieldName = UITextField()
            textFieldName.placeholder = "  Event Name"
            textFieldName.translatesAutoresizingMaskIntoConstraints = false
            textFieldName.layer.borderColor = UIColor.lightGray.cgColor
       
            // Set the border width
            textFieldName.layer.borderWidth = 1.0
            
            // Set the corner radius for rounded corners
            textFieldName.layer.cornerRadius = 5.0
            textFieldName.clipsToBounds = true
            contentView.addSubview(textFieldName)

            NSLayoutConstraint.activate([
                    textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                    textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
                ])
            
        }
    func setuptextFieldTimeSpan(){
        textFieldTimeSpan = UITextField()
        textFieldTimeSpan.placeholder = "  Time Span"
        textFieldTimeSpan.translatesAutoresizingMaskIntoConstraints = false
        textFieldTimeSpan.layer.borderColor = UIColor.lightGray.cgColor
   
        // Set the border width
        textFieldTimeSpan.layer.borderWidth = 1.0
        
        // Set the corner radius for rounded corners
        textFieldTimeSpan.layer.cornerRadius = 5.0
        textFieldTimeSpan.clipsToBounds = true
        contentView.addSubview(textFieldTimeSpan)

        NSLayoutConstraint.activate([
                textFieldTimeSpan.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                textFieldTimeSpan.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            ])
        
    }
    func setuptextFieldTimeOpening(){
        textFieldTimeOpening = UITextField()
        textFieldTimeOpening.placeholder = "  Time Opening"
        textFieldTimeOpening.translatesAutoresizingMaskIntoConstraints = false
        textFieldTimeOpening.layer.borderColor = UIColor.lightGray.cgColor
   
        // Set the border width
        textFieldTimeOpening.layer.borderWidth = 1.0
        
        // Set the corner radius for rounded corners
        textFieldTimeOpening.layer.cornerRadius = 5.0
        textFieldTimeOpening.clipsToBounds = true
        contentView.addSubview(textFieldTimeOpening)

        NSLayoutConstraint.activate([
                textFieldTimeOpening.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                textFieldTimeOpening.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            ])
        
    }
    func setuptextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "  Address"
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        textFieldAddress.layer.borderColor = UIColor.lightGray.cgColor
   
        // Set the border width
        textFieldAddress.layer.borderWidth = 1.0
        
        // Set the corner radius for rounded corners
        textFieldAddress.layer.cornerRadius = 5.0
        textFieldAddress.clipsToBounds = true
        contentView.addSubview(textFieldAddress)

        NSLayoutConstraint.activate([
                textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            ])
        
    }
    func setuptextFieldDescription(){
        textFieldDescription = UITextField()
        textFieldDescription.placeholder = "  Description"
        textFieldDescription.translatesAutoresizingMaskIntoConstraints = false
        textFieldDescription.layer.borderColor = UIColor.lightGray.cgColor
   
        // Set the border width
        textFieldDescription.layer.borderWidth = 1.0
        
        // Set the corner radius for rounded corners
        textFieldDescription.layer.cornerRadius = 5.0
        textFieldDescription.clipsToBounds = true
        contentView.addSubview(textFieldDescription)

        NSLayoutConstraint.activate([
                textFieldDescription.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                textFieldDescription.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
            ])
        
    }
        
        func setuptextFieldWebsite(){
            textFieldWebsite = UITextField()
            textFieldWebsite.placeholder = "  Website"
           
            textFieldWebsite.translatesAutoresizingMaskIntoConstraints = false
            textFieldWebsite.layer.borderColor = UIColor.lightGray.cgColor
            
            // Set the border width
            textFieldWebsite.layer.borderWidth = 1.0
            
            // Set the corner radius for rounded corners
            textFieldWebsite.layer.cornerRadius = 5.0
            textFieldWebsite.clipsToBounds = true
                
            contentView.addSubview(textFieldWebsite)
            NSLayoutConstraint.activate([
                    textFieldWebsite.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                    textFieldWebsite.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
                ])
        }
        
        
        
        func setuptextFieldPhone(){
            textFieldPhone = UITextField()
            textFieldPhone.placeholder = "  Phone"
            textFieldPhone.keyboardType = .phonePad
            textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
            textFieldPhone.layer.borderColor = UIColor.lightGray.cgColor
            
            // Set the border width
            textFieldPhone.layer.borderWidth = 1.0
            
            // Set the corner radius for rounded corners
            textFieldPhone.layer.cornerRadius = 5.0
            textFieldPhone.clipsToBounds = true
                
            contentView.addSubview(textFieldPhone)
            NSLayoutConstraint.activate([
                textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 22),
                textFieldPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -22)
                ])
        }
        
       
        
        func setupbuttonSave(){
                buttonSave = UIButton(type: .system)
                buttonSave.setTitle("Upload", for: .normal)
                buttonSave.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(buttonSave)
            }
        
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.tintColor = UIColor.darkGray
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        self.addSubview(buttonTakePhoto)
        
       

        // Position the label below the button and center it
        NSLayoutConstraint.activate([
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 60),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 60)
         
        ])
         
    }
        
        

        func initConstraints(){
            NSLayoutConstraint.activate([
                contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                contentWrapper.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                contentWrapper.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

                // Constraints for contentView
                contentView.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
                
                textFieldName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 70),
                textFieldName.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                
                buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
                buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
                buttonTakePhoto.heightAnchor.constraint(equalToConstant: 110),
              
                textFieldTimeSpan.topAnchor.constraint(equalTo:  buttonTakePhoto.bottomAnchor, constant: 50),
                textFieldTimeSpan.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldTimeOpening.topAnchor.constraint(equalTo: textFieldTimeSpan.bottomAnchor, constant: 50),
                textFieldTimeOpening.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldDescription.topAnchor.constraint(equalTo: textFieldTimeOpening.bottomAnchor, constant: 50),
                textFieldDescription.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
               
                textFieldAddress.topAnchor.constraint(equalTo: textFieldDescription.bottomAnchor, constant: 50),
                textFieldAddress.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldWebsite.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 50),
                textFieldWebsite.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                
                textFieldPhone.topAnchor.constraint(equalTo: textFieldWebsite.bottomAnchor, constant: 50),
                textFieldPhone.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
             
                        
               
                buttonSave.topAnchor.constraint(equalTo: textFieldWebsite.bottomAnchor, constant: 80),
                buttonSave.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
                buttonSave.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        }

        
        
       
        
        //unused methods...
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
