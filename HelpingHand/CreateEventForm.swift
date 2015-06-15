//
//  CreateEventForm.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit


class CreateEventForm: NSObject, FXForm {
    
    var eventName: String?
    var dateOfEvent: NSDate?
    var eventDescription: String?
    var eventURL: NSURL?
    var eventImage: UIImage?
    
    var contactEmail: String?
    var contactPhone: NSNumber?

    
    //because we want to rearrange how this form
    //is displayed, we've implemented the fields array
    //which lets us dictate exactly which fields appear
    //and in what order they appear
    
    func fields() -> [AnyObject]! {
        
        return [
            
            //we want to add a group header for the field set of fields
            //we do that by adding the header key to the first field in the group
            
            [FXFormFieldKey: "eventName", FXFormFieldHeader: "Event"],
            
            [FXFormFieldKey: "dateOfEvent", FXFormFieldType: FXFormFieldTypeDateTime],
                        
            [FXFormFieldKey: "eventURL", FXFormFieldType: FXFormFieldTypeURL],
            
            "eventImage",
            
            [FXFormFieldKey: "contactEmail", FXFormFieldHeader: "Contact Details", FXFormFieldType: FXFormFieldTypeEmail],
            
            [FXFormFieldKey: "contactPhone", FXFormFieldType: FXFormFieldTypeNumber],
            
            [FXFormFieldKey: "eventDescription", FXFormFieldType: FXFormFieldTypeLongText],
            
            [FXFormFieldTitle: "Submit", FXFormFieldHeader: "", FXFormFieldAction: "submitCreateEventForm:"],
        ]
    }
}