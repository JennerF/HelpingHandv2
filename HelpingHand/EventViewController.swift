//
//  EventViewController.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/16/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    var event : VolunteerEvent!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventDescription: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        configureName()
        configureImage()
        configureDescription()
    }
    
    func configureName() {
        eventName.text = event.eventName
    }
    
    func configureImage() {
        eventImage.image = event.getImage()
    }
    
    func configureDescription() {
        eventDescription.text = event.eventDescription
        eventDescription.editable = false
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
