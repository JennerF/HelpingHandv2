//
//  EmployeeModel.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/12/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

class Employee : PFUser, PFSubclassing {
    
    @NSManaged var firstName: String
    @NSManaged var team: String
    @NSManaged var contactPhone: NSNumber
    @NSManaged var profileImage: PFFile
    
    @NSManaged var events: [VolunteerEvent]
    @NSManaged var hoursAllowed: Double
    @NSManaged var hoursWorked: Double
    
    override class func currentUser() -> Employee {
        return PFUser.currentUser() as! Employee
    }
    
}