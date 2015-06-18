//
//  CreateEventFormViewController.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit

class CreateEventFormViewController: FXFormViewController {
    
    override func awakeFromNib() {
        
        formController.form = CreateEventForm()
    }
    
    override func viewWillAppear(animated: Bool) {
        var cancelButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target:self, action: "cancelEventCreation")
        self.navigationItem.setLeftBarButtonItem(cancelButton, animated: true)
        self.title = "Create New Event"
    }
    
    func submitCreateEventForm(cell: FXFormFieldCellProtocol) {
        
        //we can lookup the form from the cell if we want, like this:
        let form = cell.field.form as! CreateEventForm
        
        if validation(form) {
            createEvent(form)
            UIAlertView(title: "New Event Created!", message: "Thank you for your continued service to our community.", delegate: nil, cancelButtonTitle: "Sweet!").show()
            
        } else {
            
            UIAlertView(title: "User Error", message: "Please ensure that all required fields are filled in before continuing.", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    func validation(form: CreateEventForm) -> Bool {
        return true
    }
    
    func createEvent(form: CreateEventForm) {
        
        var event = VolunteerEvent()
        
        event.eventName = form.eventName!
        event.dateOfEvent = form.dateOfEvent!
        event.eventDescription = form.eventDescription!
        event.eventURL = form.eventURL!.absoluteString!
        
        event.eventImage = PFFile(data: UIImageJPEGRepresentation(form.eventImage, 1.0))
        event.contactEmail = form.contactEmail!
        event.contactPhone = form.contactPhone!
        
        event.saveInBackgroundWithBlock{  (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                NSLog("Event has been created and saved")
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                // There was a problem, check error.description
                NSLog("ERROR - event has not been saved")
            }
        }
    }
    
    func cancelEventCreation() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
}