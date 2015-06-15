//
//  CreateEventForm.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit


class MainPageForm: NSObject, FXForm {
    
    var createEvent: Selector?
    var allEvents: Selector?

    
    
    
    func fields() -> [AnyObject]! {
        
        return [
            // Create a new event
            [FXFormFieldKey: "createEvent", FXFormFieldHeader: "Events", FXFormFieldAction: "createEventSelector"],
            
            // Show all events
            [FXFormFieldKey: "allEvents", FXFormFieldAction: "showAllEventsSelector"],

            
        ]
    }
}