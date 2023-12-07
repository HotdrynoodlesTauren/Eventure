//
//  Event.swift
//  Eventure
//
//

import Foundation
import UIKit

struct Event{
    var eventName:String?
    var eventId:String?
    // User who posted this event
    var userId:String?
    var image:String?
    var timeSpan:String?
    var timeOpening:String?
    var phoneNumber:String?
    var address:String?
    var website:String?
    var description:String?
    var reviews:[Review]?
    var imageUrl: URL? {
        guard let imageString = image, !imageString.isEmpty else { return nil }
        return URL(string: imageString)
    }
    
    init(documentData: [String: Any], eventId: String) {
        self.eventName = documentData["eventName"] as? String
        self.eventId = eventId
        self.userId = documentData["userId"] as? String
        self.image = documentData["image"] as? String
        self.timeSpan = documentData["timeSpan"] as? String
        self.timeOpening = documentData["timeOpening"] as? String
        self.phoneNumber = documentData["phoneNumber"] as? String
        self.address = documentData["address"] as? String
        self.website = documentData["website"] as? String
        self.description = documentData["description"] as? String
        self.reviews = documentData["reviews"] as? [Review]
    }
}

struct Review{
    var userName:String?
    var userId:String?
//    var rating:Int?
    var images:UIImage?
    var reviewContent:String?
    
    init(userName: String? = nil, userId: String? = nil, images: UIImage? = nil, reviewContent: String? = nil) {
        self.userName = userName
        self.userId = userId
//        self.rating = rating
        self.images = images
        self.reviewContent = reviewContent
    }
}

//struct User: Codable{
//    var email: String!
//    var name: String!
//    var profileImageURL: String!
//    var uid: String!
//    
//    init(email: String!, name: String!, profileImageURL: String!, uid: String!) {
//        self.email = email
//        self.name = name
//        self.profileImageURL = profileImageURL
//        self.uid = uid
//    }
//}
