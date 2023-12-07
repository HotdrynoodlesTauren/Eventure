//
//  EventWriteAReviewViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
//import FirebaseStorage

class EventWriteAReviewViewController: UIViewController {
    
    let eventWriteAReviewScreen = EventWriteAReviewView()
    var reviewToSubmit:Review!
    var pickedImage: UIImage!
    let database = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let defaults = UserDefaults.standard
    
    override func loadView(){
        view = eventWriteAReviewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write A Review"
        view = eventWriteAReviewScreen
        
        eventWriteAReviewScreen.buttonUploadPhotos.menu = getMenuImagePicker()
        eventWriteAReviewScreen.buttonSubmit.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonSubmitTapped(){
//        let rating = eventWriteAReviewScreen.textField.text
        let review = eventWriteAReviewScreen.textViewReviews.text

        
        if let uwReview = review{
            if uwReview.isEmpty {
                showEmptyErrorAlert()
            }else{
                let userName = defaults.object(forKey: "userName") as! String?
                let userId = defaults.object(forKey: "userId") as! String?
                var reviewImageURL: String!
                if let uwPickedImage = pickedImage{
//                    uploadProfilePhotoToStorage()
                } else {
                    reviewImageURL = ""
                }
                reviewToSubmit = Review(userName: userName, userId: userId, images: pickedImage, reviewContent: uwReview)
                print(reviewToSubmit!)
                self.notificationCenter.post(name: .reviewAdded, object: reviewToSubmit)
                
                navigationController?.popViewController(animated: true)
            }
        }
    }
    

    
    func showEmptyErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "Please write something before saving!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title:"Camera", handler: {(_) in self.pickUsingCamera()}),
            UIAction(title: "Callery", handler: {(_) in self.pickFromGallery()})
        ]
        return UIMenu(title: "Select Source", children: menuItems)
    }
    
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    func pickFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of:[.images])
        configuration.selectionLimit = 1
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion:nil)
    }

}

extension EventWriteAReviewViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        let itemprovider = results.map(\.itemProvider)
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: {
                    (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.eventWriteAReviewScreen.imageReview.image = uwImage
                            self.pickedImage = uwImage
                        }else{
                        }
                    }
                })
            }
        }
    }
}

extension EventWriteAReviewViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        picker.dismiss(animated: true)
        if let image = info[.editedImage] as? UIImage{
            self.eventWriteAReviewScreen.imageReview.image = image
            self.pickedImage = image
        }else{
        }
    }
}
