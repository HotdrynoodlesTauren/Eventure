import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseStorage


class UploadEventScreenController: UIViewController {
    
    let uploadEventsView = UploadEventScreen()
    var firestore: Firestore! // Firestore reference
    var pickedImage:UIImage?
    let defaults = UserDefaults.standard
    
    
    override func loadView() {
        view = uploadEventsView
        let backgroundImage = UIImage(named: "Img 2")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(backgroundImageView, at: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upload Event"
        uploadEventsView.buttonTakePhoto.menu = getMenuImagePicker()
        uploadEventsView.buttonSave.addTarget(self, action: #selector(uploadEventToFirebase), for: .touchUpInside)
        
        firestore = Firestore.firestore() // Initialize Firestore
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        // Removing the keyboard from screen...
        view.endEditing(true)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
        
    }
    func uploadImageToFirebase(completion: @escaping (String?) -> Void) {
        guard let pickedImage = pickedImage else {
            showAlert(message: "Please select an image for the event.")
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

    func isValidPhone(_ phone: String) -> Bool {
        // Check if phone number is exactly 10 digits long
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }

    @objc func uploadEventToFirebase() {
        uploadImageToFirebase { [weak self] imageURL in
            guard let self = self, let imageURL = imageURL else {
                // Handle the case where image URL is nil
                self?.showAlert(message: "Error: Please upload an image.")
                return
            }
            
            // Collect data from text fields and check if any are empty
            guard let eventName = self.uploadEventsView.textFieldName.text, !eventName.isEmpty,
                  let eventWebsite = self.uploadEventsView.textFieldWebsite.text, !eventWebsite.isEmpty,
                  let eventPhone = self.uploadEventsView.textFieldPhone.text, !eventPhone.isEmpty,
                  let eventTimeSpan = self.uploadEventsView.textFieldTimeSpan.text, !eventTimeSpan.isEmpty,
                  let eventTimeOpening = self.uploadEventsView.textFieldTimeOpening.text, !eventTimeOpening.isEmpty,
                  let eventAddress = self.uploadEventsView.textFieldAddress.text, !eventAddress.isEmpty,
                  let eventDescription = self.uploadEventsView.textFieldDescription.text, !eventDescription.isEmpty else {
                self.showAlert(message: "Error: One or more fields are empty.")
                return
            }

        

            if !isValidPhone(eventPhone) {
                showAlert(message: "Invalid Phone Number")
                return}
            let userId = defaults.object(forKey: "userId") as! String?
            // Create a dictionary or a custom object for the event
            let eventData: [String: Any] = [
                "eventName": eventName,
                "website": eventWebsite,
                "phoneNumber": eventPhone,
                "timeSpan": eventTimeSpan,
                "image": imageURL,
                "timeOpening": eventTimeOpening,
                "address": eventAddress,
                "description": eventDescription,
                "userId": userId
                
            ]
            
            // Upload to Firebase
            firestore.collection("Longterm Events").addDocument(data: eventData) { error in
                if let error = error {
                    // Handle the error, show an alert to the user
                    self.showAlert(message:"Error adding document: \(error)")
                    
                } else {
                    let alert = UIAlertController(title: "Success!", message: "Successfully Uploaded!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                            // Pop the view controller after the alert has been dismissed
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
    }
}
extension UploadEventScreenController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.uploadEventsView.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}
extension UploadEventScreenController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.uploadEventsView.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            showAlert(message: "Image not loaded, try again")
        }
    }
}
