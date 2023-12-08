//
//  EventDetailViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventDetailViewController: EventInfoViewController {
    
    let eventDetailScreen = EventDetailView()
//    var row:Int!
    
    override func loadView(){
        view = eventDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let eventName = receivedEvent.eventName{
            if !eventName.isEmpty{
                title = eventName
            }
        }
        
//        if let image = receivedEvent.image{
//            if !image.isEmpty{
//                need to get image from url
//                eventDetailScreen.imageEvent.image = image
//            }
//        }
        
        
        if let timeSpan = receivedEvent.timeSpan{
            if !timeSpan.isEmpty{
                eventDetailScreen.labelTimeSpan.text = timeSpan
            }
        }
        
        if let timeOpening = receivedEvent.timeOpening{
            if !timeOpening.isEmpty{
                eventDetailScreen.labelTimeOpening.text = timeOpening
            }
        }
        
        if let phoneNumber = receivedEvent.phoneNumber{
            if !phoneNumber.isEmpty{
                eventDetailScreen.labelPhone.text = phoneNumber
            }
        }
        
        if let address = receivedEvent.address{
            if !address.isEmpty{
                eventDetailScreen.labelAddress.text = address
            }
        }
        if let website = receivedEvent.website{
            if !website.isEmpty{
                eventDetailScreen.labelWebsite.text = website
            }
        }
        
        if let desscription = receivedEvent.description{
            if !desscription.isEmpty{
                eventDetailScreen.textViewDescription.text = desscription
            }
        }
        
    }
    
    

}
