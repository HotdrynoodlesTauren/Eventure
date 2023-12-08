//
//  EventWriteAReviewView.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventWriteAReviewView: UIView {

    var imageReview:UIImageView!
    var buttonUploadPhotos:UIButton!
    var labelRateYourVisit:UILabel!
    var labelShareYourReview:UILabel!
    var textViewReviews:UITextView!
    var buttonSubmit:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupImageReview()
        setupButtonUploadPhotos()
//        setupLabelRateYourVisit()
        setupLabelShareYourReview()
        setupTextViewReviews()
        setupButtonSubmit()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageReview(){
        imageReview = UIImageView()
        imageReview.image = UIImage(systemName: "camera.fill")
        imageReview.contentMode = .scaleAspectFit
        imageReview.clipsToBounds = true
        imageReview.layer.cornerRadius = 10
        imageReview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageReview)
    }
    
    func setupButtonUploadPhotos(){
        buttonUploadPhotos = UIButton(type: .system)
        buttonUploadPhotos.setTitle("Upload Photos", for: .normal)
        buttonUploadPhotos.showsMenuAsPrimaryAction = true
        buttonUploadPhotos.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonUploadPhotos.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonUploadPhotos)
    }
    
    func setupLabelRateYourVisit(){
        labelRateYourVisit = UILabel()
        labelRateYourVisit.text = "Rate your visit"
        labelRateYourVisit.textAlignment = .center
        labelRateYourVisit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelRateYourVisit)
    }
    
    func setupLabelShareYourReview(){
        labelShareYourReview = UILabel()
        labelShareYourReview.text = "Share Your Review:"
        labelShareYourReview.textAlignment = .center
        labelShareYourReview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelShareYourReview)
    }
    
    func setupTextViewReviews(){
        textViewReviews = UITextView()
        textViewReviews.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        textViewReviews.font = UIFont.systemFont(ofSize: 16)
        textViewReviews.textAlignment = .left
        textViewReviews.isEditable = true
        textViewReviews.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textViewReviews)
    }
    
    func setupButtonSubmit(){
        buttonSubmit = UIButton(type: .system)
        buttonSubmit.setTitle("Save", for: .normal)
        buttonSubmit.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmit)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            imageReview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageReview.heightAnchor.constraint(equalToConstant: 150),
            imageReview.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageReview.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            buttonUploadPhotos.topAnchor.constraint(equalTo: imageReview.bottomAnchor, constant: 5),
            buttonUploadPhotos.trailingAnchor.constraint(equalTo: imageReview.trailingAnchor),
            
//            labelRateYourVisit.topAnchor.constraint(equalTo: buttonUploadPhotos.bottomAnchor, constant: 16),
//            labelRateYourVisit.leadingAnchor.constraint(equalTo: imageReview.leadingAnchor),
            
            labelShareYourReview.topAnchor.constraint(equalTo: buttonUploadPhotos.bottomAnchor, constant: 10),
            labelShareYourReview.leadingAnchor.constraint(equalTo: imageReview.leadingAnchor),
            
            textViewReviews.topAnchor.constraint(equalTo: labelShareYourReview.bottomAnchor, constant: 10),
            textViewReviews.leadingAnchor.constraint(equalTo: imageReview.leadingAnchor),
            textViewReviews.trailingAnchor.constraint(equalTo: imageReview.trailingAnchor),
            textViewReviews.heightAnchor.constraint(equalToConstant: 300),
            
            buttonSubmit.topAnchor.constraint(equalTo: textViewReviews.bottomAnchor, constant: 5),
            buttonSubmit.trailingAnchor.constraint(equalTo: imageReview.trailingAnchor),
        ])
    }
}
