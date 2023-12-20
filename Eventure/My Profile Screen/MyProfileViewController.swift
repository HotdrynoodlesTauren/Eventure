
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import PhotosUI

class MyProfileViewController: UIViewController {
    var delegate: ViewController!
    var currentUser: FirebaseAuth.User?
    var pickedImage: UIImage?
    var events: [Event] = []
    var shouldReloadData = true
    
    let database = Firestore.firestore()
    let storage = Storage.storage()
    let profileView = ProfileView()
    let defaults = UserDefaults.standard
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEventsFromFirebase()
        profileView.tableView.delegate = self
                profileView.tableView.dataSource = self
       
        fetchDataIfNeeded()
        retrieveProfilePicture()
        
        profileView.cameraButton.menu = getMenuImagePicker()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", image: .none, target: self, action: #selector(onButtonLogoutTapped))
        
        profileView.configureRefreshButtonAction(target: self, action: #selector(refreshButtonTapped))
        if let currentUser = Auth.auth().currentUser {
                profileView.nameLabel.text = currentUser.displayName ?? "No Name"
                profileView.emailLabel.text = currentUser.email ?? "No Email"
            }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataIfNeeded()
    }
    @objc func refreshButtonTapped() {
        fetchEventsFromFirebase()
        retrieveProfilePicture()
        if let currentUser = Auth.auth().currentUser {
                profileView.nameLabel.text = currentUser.displayName ?? "No Name"
                profileView.emailLabel.text = currentUser.email ?? "No Email"
            }
    }


    func fetchDataIfNeeded() {
        if shouldReloadData {
         
            fetchEventsFromFirebase()
            shouldReloadData = false
        }
    }

    
    func uploadProfilePicture() {
        guard let pickedImage = self.pickedImage else {
            print("Profile picture is nil")
            return
        }

        guard let imageData = pickedImage.jpegData(compressionQuality: 0.4) else {
            print("Failed to get image data")
            return
        }

        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user signed in")
            return
        }

        let profileImageRef = storage.reference().child("profile_images/\(userId).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        profileImageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            if let error = error {
                print("Error uploading profile picture: \(error.localizedDescription)")
            } else {
                print("Profile picture uploaded successfully")
                
                profileImageRef.downloadURL { (url, error) in
                    if let downloadURL = url {
                        let userDocRef = self.database.collection("users").document(userId)
                        userDocRef.setData(["profileImageURL": downloadURL.absoluteString], merge: true)
                    }
                }
            }
        }
    }
    @objc func onButtonLogoutTapped(){
        defaults.set(nil, forKey: "userName")
        defaults.set(nil, forKey: "userId")
        defaults.set(nil, forKey: "userEmail")
        let loginController = LoginViewController()
        loginController.hidesBottomBarWhenPushed = true
        navigationController?.popViewController(animated: false)
        navigationController?.pushViewController(loginController, animated: true)
    }
    func retrieveProfilePicture() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user signed in")
            return
        }

        let userDocRef = database.collection("users").document(userId)

        userDocRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let userData = document.data()
      
                if let profileImageURLString = userData?["profileImageURL"] as? String,
                   let profileImageURL = URL(string: profileImageURLString) {

                    URLSession.shared.dataTask(with: profileImageURL) { (data, _, error) in
                        if let error = error {
                            print("Error downloading profile picture: \(error.localizedDescription)")
                            return
                        }

                        if let data = data, let profileImage = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.profileView.profileImageView.image = profileImage
                            }
                        } else {
                            print("Error creating image from data")
                        }
                    }.resume()
                } else {
                    print("No profile picture URL found for the user")
                }
            } else {
                print("Document does not exist or error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    func fetchUserData() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let userDocRef = database.collection("users").document(userId)
        
        userDocRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let userData = document.data()
                let userName = userData?["name"] as? String ?? "Anonymous"
                let userEmail = userData?["email"] as? String ?? "No Email"
                
                DispatchQueue.main.async {
                    self.profileView.nameLabel.text = "\(userName)"
                    self.profileView.emailLabel.text = "\(userEmail)"
                }
            } else {
                print("Document does not exist or error: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    func getMenuImagePicker() -> UIMenu {
        var menuItems = [
            UIAction(title: "Camera", handler: { _ in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: { _ in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func fetchEventsFromFirebase() {
        // Get the current user's ID
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            self.showAlert(message: "No user signed in")
            return
        }

        let db = Firestore.firestore()
        // Query for events where 'userId' field matches the current user's ID
        db.collection("Longterm Events").whereField("userId", isEqualTo: currentUserId).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                self?.showAlert(message: "Error getting documents")
                return
            } else {
                var fetchedEvents: [Event] = []
                for document in querySnapshot!.documents {
              
                    let event = Event(documentData: document.data(), eventId: document.documentID)
                    fetchedEvents.append(event)
                }
                DispatchQueue.main.async {
                    self?.events = fetchedEvents
                    self?.profileView.tableView.reloadData()
                }
            }
        }
    }

}




extension MyProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            self.profileView.cameraButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            self.pickedImage = image
        } else {
        }
    }
}

extension MyProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        guard let itemProvider = results.first?.itemProvider else { return }
        
        if itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    if let pickedImage = image as? UIImage {
                        self.profileView.profileImageView.image = pickedImage
                        self.pickedImage = pickedImage
                        self.uploadProfilePicture()
                    }
                }
            }
        }
        
        picker.dismiss(animated: true)
    }
}


extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewPostCell.identifier, for: indexPath) as! TableViewPostCell
        cell.configure(with: events[indexPath.row])
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return events.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}

