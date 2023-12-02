//
//  Event.swift
//  Eventure
//
//

import Foundation

struct Event {
    let id: String
    let name: String
    let description: String
    let details: String
    let imageUrlString: String

    // Computed property to get a URL from the imageUrlString
    var imageUrl: URL? {
        return URL(string: imageUrlString)
    }

    // Initializer for Firebase document data
    init?(documentData: [String: Any], id: String) {
        guard let name = documentData["name"] as? String,
              let description = documentData["description"] as? String,
              let details = documentData["details"] as? String,
              let imageUrlString = documentData["imageUrl"] as? String else { return nil }

        self.id = id
        self.name = name
        self.description = description
        self.details = details
        self.imageUrlString = imageUrlString
    }
}
