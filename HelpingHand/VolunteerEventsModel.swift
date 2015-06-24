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
    
    func getEvents(filter : String) {
        if filter == "All" {
            getAllEvents()
        }
        else if filter == "NextWeek" {
            getNextWeeksEvents()
        }
    }
    
    func getAllEvents() {
        var query = PFQuery(className: "VolunteerEvent")
        let postFilterDate : NSDate = NSDate()
        query.whereKey("dateOfEvent", greaterThanOrEqualTo: postFilterDate)
        
        var objects = query.findObjects()
        if let events = objects as? [VolunteerEvent] {
            self.eventList = events
        }
    }

    func getNextWeeksEvents() {
            
        let preFilterDate : NSDate = NSDate().xWeeks(1)
        let postFilterDate : NSDate = NSDate()
            
        var query = PFQuery(className: "VolunteerEvent")
            
        query.whereKey("dateOfEvent", lessThanOrEqualTo: preFilterDate)
        query.whereKey("dateOfEvent", greaterThanOrEqualTo: postFilterDate)
            
        var objects = query.findObjects()
        
        if let events = objects as? [VolunteerEvent] {
            self.eventList = events
        }
    }
    
    func getPopularEvents() {
        
        let postFilterDate : NSDate = NSDate()
        
        var query = PFQuery(className: "VolunteerEvent")
        
        query.whereKey("dateOfEvent", greaterThanOrEqualTo: postFilterDate)
        query.whereKey("attendeesCount", greaterThanOrEqualTo: Constants.NumberOfAttendeesToBePopular)
    }
    
}