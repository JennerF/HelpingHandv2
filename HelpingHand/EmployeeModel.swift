//
//  EmployeeModel.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/12/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

class Employee : PFUser, PFSubclassing {
    
    var firstName : String {
        get {
            return objectForKey("firstName") as? String ?? ""
        }
        set {
            setObject(newValue, forKey: "firstName")
        }
    }
    
    var team : String {
        get {
            return objectForKey("team") as? String ?? "none"
        }
        set {
            setObject(newValue, forKey: "team")
        }
    }

    var contactPhone : NSNumber {
        get {
            return objectForKey("contactPhone") as? NSNumber ?? 0 //using 0 for phone number not set
        }
        set {
            setObject(newValue, forKey: "firstName")
        }
    }
    
    var profileImage : PFFile {
        get {
            let image = UIImage(named: "blankProfilePicture") as UIImage!
            let imageAsPF : PFFile = convertImageToPFFile(image)
            return objectForKey("profileImage") as? PFFile ?? imageAsPF
        }
        set {
            setObject(newValue, forKey: "profileImage")
        }
    }
    
    var events : [VolunteerEvent] {
        get {
            return objectForKey("events") as? [VolunteerEvent] ?? []
        }
        set {
            setObject(newValue, forKey: "events")
        }
    }
    
    var hoursAllowed : Double {
        get {
            return objectForKey("hoursAllowed") as? Double ?? 0
        }
        set {
            setObject(newValue, forKey: "hoursAllowed")
        }
    }
    
    var hoursWorked : Double {
        get {
            return objectForKey("hoursWorked") as? Double ?? 0
        }
        set {
            setObject(newValue, forKey: "hoursWorked")
        }
    }
    
    override class func currentUser() -> Employee {
        return PFUser.currentUser() as! Employee
    }
    
    func convertImageToPFFile(image : UIImage) -> PFFile {
         return PFFile(data: UIImageJPEGRepresentation(image, 1.0))
    }
}