//
//  NewUserForm.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit


class NewUserForm: NSObject, FXForm {
    
    var contactEmail: String?
    var password: String?
    var passwordAgain: String?
    
    var firstName: String?
    var team: String?
    var contactPhone: NSNumber?
    var profileImage: UIImage?
    
    //because we want to rearrange how this form
    //is displayed, we've implemented the fields array
    //which lets us dictate exactly which fields appear
    //and in what order they appear
    
    func fields() -> [AnyObject]! {
        
        return [
            
            //we want to add a group header for the field set of fields
            //we do that by adding the header key to the first field in the group
            
            [FXFormFieldKey: "contactEmail", FXFormFieldHeader: "User Info"],
            
            [FXFormFieldKey: "password", FXFormFieldType: FXFormFieldTypePassword],
            
            [FXFormFieldTitle: "Login", FXFormFieldHeader: "", FXFormFieldAction: "submitLogin:"],
            
            [FXFormFieldKey: "passwordAgain", FXFormFieldHeader: "New User", FXFormFieldType: FXFormFieldTypePassword],
            
            [FXFormFieldKey: "firstName"],
            
            [FXFormFieldKey: "team"], //make this a choice between locations and teams later
            
            [FXFormFieldKey: "contactPhone", FXFormFieldType: FXFormFieldTypeNumber],
            
            [FXFormFieldKey: "profileImage", FXFormFieldType: FXFormFieldTypeImage],
            
            [FXFormFieldTitle: "Create User", FXFormFieldHeader: "", FXFormFieldAction: "submitCreateUserForm:"],
        ]
    }
}