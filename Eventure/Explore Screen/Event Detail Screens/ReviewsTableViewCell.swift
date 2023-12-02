//
//  ReviewsTableViewCell.swift
//  Details
//
//  Created by Yi Zhou on 11/29/23.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {


    var wrapperCellView: UIView!
    var imageReview: UIImageView!
    var labelReview: UILabel!
    var labelRating: UILabel!
    var textViewReview:UITextView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupImageReview()
        setupLabelReview()
        setupLabelRating()
        setupTextViewReview()
        
        initConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupImageReview(){
        imageReview = UIImageView()
        imageReview.image = UIImage(systemName: "camera.fill")
        imageReview.contentMode = .scaleToFill
        imageReview.clipsToBounds = true
        imageReview.layer.cornerRadius = 10
        imageReview.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageReview)
    }
    
    func setupLabelReview(){
        labelReview = UILabel()
        labelReview.text = "UserName"
        labelReview.font = UIFont.systemFont(ofSize: 14)
        labelReview.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelReview)
    }
    
    func setupLabelRating(){
        labelRating = UILabel()
        labelRating.text = "Rating"
        labelRating.font = UIFont.systemFont(ofSize: 14)
        labelRating.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelRating)
    }
    
    func setupTextViewReview(){
        textViewReview = UITextView()
        textViewReview.font = UIFont.systemFont(ofSize: 16)
        textViewReview.textAlignment = .left
        textViewReview.isEditable = false
        textViewReview.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(textViewReview)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            imageReview.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            imageReview.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageReview.heightAnchor.constraint(equalToConstant: 160),
            imageReview.widthAnchor.constraint(equalToConstant: 200),
            
            labelReview.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelReview.leadingAnchor.constraint(equalTo: imageReview.trailingAnchor, constant: 10),
//            labelReview.heightAnchor.constraint(equalToConstant: 20),
//            labelReview.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor, constant: -10),
            
            labelRating.topAnchor.constraint(equalTo: labelReview.bottomAnchor, constant: 10),
            labelRating.leadingAnchor.constraint(equalTo: labelReview.leadingAnchor),
            
            textViewReview.topAnchor.constraint(equalTo: labelRating.bottomAnchor, constant: 16),
            textViewReview.bottomAnchor.constraint(equalTo: imageReview.bottomAnchor),
            textViewReview.leadingAnchor.constraint(equalTo: labelReview.leadingAnchor),
            textViewReview.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 186)
            
        ])
    }

}
