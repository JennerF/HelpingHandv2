//
//  VolunteerEventsModel.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/16/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

class VolunteerEvents {
    
    var eventList : [VolunteerEvent] = []
    
    
    
    func getAllEvents() {
        var query = PFQuery(className: "VolunteerEvent")
        var objects = query.findObjects()
        if let events = objects as? [VolunteerEvent] {
            self.eventList = events
        }
//       query.findObjectsInBackgroundWithBlock({(events : [AnyObject]?, error : NSError?) in
//            if (error == nil) {
//                if let eventsParsed = events as? [VolunteerEvent] {
//                    self.eventList = eventsParsed
//                }
//            }
//        })
    }
    
    
    
    
    
    
    
    
}