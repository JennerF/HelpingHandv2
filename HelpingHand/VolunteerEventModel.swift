//
//  VolunteerEventModel.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/12/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

class VolunteerEvent : PFObject, PFSubclassing {
    
    @NSManaged var eventName: String
    @NSManaged var dateOfEvent: NSDate
    @NSManaged var eventDescription: String
    @NSManaged var eventURL: String?
    @NSManaged var eventImage: PFFile
    
    @NSManaged var contactEmail: String
    @NSManaged var contactPhone: NSNumber
    
    @NSManaged var eventOrganizer: Employee
    @NSManaged var eventAttendees: [Employee]
    
    class func parseClassName() -> String {
        return "VolunteerEvent"
    }
    
    func getImage() -> UIImage {
        var image : UIImage = UIImage()
        
        eventImage.getDataInBackgroundWithBlock({
            (imageData: NSData?, error: NSError?) -> Void in
            if (error == nil) {
                image = UIImage(data: imageData!)!
                
            }})
        return image
    }

}
