//
//  Event.swift
//  Eventure
//
//

import Foundation
import UIKit

struct Event: Codable{
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
        return URL(string: image!)
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

struct Review: Codable{
    var userName:String?
    var userId:String?
    var rating:Int?
    var images:String?
    var reviewContent:String?
    
    init(userName: String? = nil, userId: String? = nil, rating: Int? = nil, images: String? = nil, reviewContent: String? = nil) {
        self.userName = userName
        self.userId = userId
        self.rating = rating
        self.images = images
        self.reviewContent = reviewContent
    }
}


