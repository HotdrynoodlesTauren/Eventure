//
//  EventWriteAReviewViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseStorage

class EventWriteAReviewViewController: UIViewController {
    
    let eventWriteAReviewScreen = EventWriteAReviewView()
    var reviewToSubmit:Review!
    var pickedImage: UIImage!
    let database = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    let defaults = UserDefaults.standard
    var firestore: Firestore! // Firestore reference
    var receivedEventId:String!
    
    override func loadView(){
        view = eventWriteAReviewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write A Review"
        firestore = Firestore.firestore()
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
                let eventId = receivedEventId
//                var reviewImageURL: String!
                
                    uploadImageToFirebase { [weak self] imageURL in
                        guard let imageURL = imageURL, let userId = userId, let userName = userName, let eventId = eventId else {
                            // Handle the case where image URL is nil
                            self?.showAlert(message: "Error: Please upload an image.")
                            return
                        }
                        let reviewData: [String: Any] = [
                            "eventId":eventId,
                            "images": imageURL,
                            "reviewContent": uwReview,
                            "userId": userId,
                            "userName": userName,
                         ]
                        print(reviewData)
                        // Upload to Firebase
                        self?.firestore.collection("Reviews").addDocument(data: reviewData) { error in
                            if let error = error {
                                // Handle the error, show an alert to the user
                                self?.showAlert(message:"Error adding document: \(error)")
                            } else {
//                                let alert = UIAlertController(title: "Success!", message: "Successfully Uploaded!", preferredStyle: .alert)
//                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
//                                self?.present(alert, animated: true, completion: nil)
                                
                            }
                        }
                    }
                        
                // Save to previous screen
                if let uwPickedImage = pickedImage{
                    reviewToSubmit = Review(userName: userName, userId: userId, eventId: eventId, images: pickedImage, reviewContent: uwReview)
                    self.notificationCenter.post(name: .reviewAdded, object: reviewToSubmit)
                    navigationController?.popViewController(animated: true)
                } else {
                    showAlert(message: "Error: Please upload an image.")
                }
            }
        }
    }
    
    func uploadImageToFirebase(completion: @escaping (String?) -> Void) {
        guard let pickedImage = pickedImage else {
            showAlert(message: "Please select an image for the review.")
            completion(nil)
            return
        }

        guard let imageData = pickedImage.jpegData(compressionQuality: 0.75) else {
            showAlert(message: "Error in image data conversion.")
            completion(nil)
            return
        }

        let imageName = UUID().uuidString + ".jpg"
        let storageRef = Storage.storage().reference().child("event_images/\(imageName)")

        storageRef.putData(imageData, metadata: nil) { [weak self] metadata, error in
            guard let self = self else { return }

            if let error = error {
                self.showAlert(message: "Error uploading image: \(error)")
                completion(nil)
                return
            }

            storageRef.downloadURL { url, error in
                if let error = error {
                    self.showAlert(message: "Error getting image URL: \(error)")
                    completion(nil)
                } else if let imageURL = url?.absoluteString {
                    completion(imageURL)
                }
            }
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showEmptyErrorAlert(){
        let alert = UIAlertController(title: "Error!", message: "Please write something before saving!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title:"Camera", handler: {(_) in self.pickUsingCamera()}),
            UIAction(title: "Gallery", handler: {(_) in self.pickFromGallery()})
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
