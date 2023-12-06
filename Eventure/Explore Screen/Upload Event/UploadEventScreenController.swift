//
//  UploadEventScreenController.swift
//  Eventure
//
//  Created by Qin on 2023-12-03.
//

import UIKit

class UploadEventScreenController: UIViewController {

   
        let uploadEventsView = UploadEventScreen()
        
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
         
           
        }
    }
