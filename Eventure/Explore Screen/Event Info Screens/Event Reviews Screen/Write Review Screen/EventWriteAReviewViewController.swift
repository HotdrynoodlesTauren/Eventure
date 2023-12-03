//
//  EventWriteAReviewViewController.swift
//  Details
//
//  Created by Yi Zhou on 11/27/23.
//

import UIKit

class EventWriteAReviewViewController: UIViewController {
    
    let eventWriteAReviewScreen = EventWriteAReviewView()
    var reviewToSubmit:Review!
    
    override func loadView(){
        view = eventWriteAReviewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Write A Review"
        view = eventWriteAReviewScreen
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
