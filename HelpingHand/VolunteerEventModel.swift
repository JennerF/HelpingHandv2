//
//  VolunteerEventModel.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/12/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

class VolunteerEvent : PFObject, PFSubclassing {
    
    var eventName : String {
        get {
            return objectForKey("eventName") as? String ?? ""
        }
        set {
            setObject(newValue, forKey: "eventName")
        }
    }
    
    var dateOfEvent : NSDate {
        get {
            let calendar = NSCalendar.currentCalendar()
            let components = NSDateComponents()
            components.year = 1900
            components.month = 1
            components.day = 1
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            let date = calendar.dateFromComponents(components)
            
            return objectForKey("dateOfEvent") as? NSDate ?? date!
        }
        set {
            setObject(newValue, forKey: "dateOfEvent")
        }
    }
    
    
    var eventDescription : String {
        get {
            return objectForKey("eventDescription") as? String ?? ""
        }
        set {
            setObject(newValue, forKey: "eventDescription")
        }
    }
    
    var eventURL : String {
        get {
            return objectForKey("eventURL") as? String ?? ""
        }
        set {
            setObject(newValue, forKey: "eventURL")
        }
    }
    
    var eventImage : PFFile {
        get {
            let image = UIImage(named: "blankEventImage.png") as UIImage!
            let imageAsPF : PFFile = convertImageToPFFile(image)
            return objectForKey("eventImage") as? PFFile ?? imageAsPF
        }
        set {
            setObject(newValue, forKey: "eventImage")
        }
    }
    
    var contactEmail : String {
        get {
            return objectForKey("contactEmail") as? String ?? ""
        }
        set {
            setObject(newValue, forKey: "contactEmail")
        }
    }
    
    var contactPhone : NSNumber {
        get {
            return objectForKey("contactPhone") as? NSNumber ?? 0 //using 0 as a filler nil value
        }
        set {
            setObject(newValue, forKey: "contactPhone")
        }
    }
    
    var eventOrganizer : Employee {
        get {
            return objectForKey("eventOrganizer") as? Employee ?? Employee()
        }
        set {
            setObject(newValue, forKey: "eventOrganizer")
        }
    }
    
    var eventAttendees : [Employee] {
        get {
            return objectForKey("eventAttendees") as? [Employee] ?? []
        }
        set {
            setObject(newValue, forKey: "eventAttendees")
        }
    }
    
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
    
    func convertImageToPFFile(image : UIImage) -> PFFile {
        return PFFile(data: UIImageJPEGRepresentation(image, 1.0))
    }

}
