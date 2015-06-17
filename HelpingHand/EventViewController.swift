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
    @IBOutlet weak var addEventButton: UIButton!
    @IBOutlet weak var starEventButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        configureName()
        configureImage()
        configureDescription()
        configureAddEventButton()
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
    
    func configureAddEventButton() {
        addEventButton.frame = CGRectMake(0, 0, 100, 100)
        let plusImage = UIImage(named: "addIcon.png") as UIImage!
        addEventButton.setImage(plusImage, forState: UIControlState.Normal)
        addEventButton.setTitle("", forState: UIControlState.Normal)
        addEventButton.imageEdgeInsets = UIEdgeInsetsMake(25, 25, 25, 25)
    }
    
    
    @IBAction func joinEvent(sender: AnyObject) {
        var employee = Employee.currentUser()
        employee.events.append(event)
        employee.saveInBackgroundWithBlock(nil)
        
        print(event.eventAttendees)
        print(employee)
        print(event.eventAttendees)
        
        event.eventAttendees = []
        
        event.eventAttendees.append(employee)
        event.saveInBackgroundWithBlock(nil)
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
