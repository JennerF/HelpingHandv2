//
//  NewUserFormViewController.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit

class NewUserFormViewController: FXFormViewController {
    
    override func awakeFromNib() {
        
        formController.form = NewUserForm()
    }
    
    func submitCreateUserForm(cell: FXFormFieldCellProtocol) {
        
        //we can lookup the form from the cell if we want, like this:
        let form = cell.field.form as! NewUserForm
        
        if validation(form) {
            createEmployee(form)
            UIAlertView(title: "Welcome", message: "Thank you for your continued service to our community.", delegate: nil, cancelButtonTitle: "Sweet!").show()
            
        } else {
            
            UIAlertView(title: "User Error", message: "Please ensure that all required fields are filled in before continuing.", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    func submitLogin(cell: FXFormFieldCellProtocol) {
        let form = cell.field.form as! NewUserForm
        
        PFUser.logInWithUsernameInBackground(form.contactEmail!, password: form.password!, block: {(user,error) in NSLog("test")})
        
        self.switchToMainView()
    }
    
    func validation(form: NewUserForm) -> Bool {
        return true
    }
    
    func createEmployee(form: NewUserForm) {
        
        var employee = Employee()
        
        employee.firstName = form.firstName!
        employee.team = form.team!
        employee.contactPhone = form.contactPhone!
        employee.profileImage = PFFile(data: UIImagePNGRepresentation(form.profileImage))
        employee.events = []
        employee.hoursAllowed = 0
        employee.hoursWorked = 0
        
        employee.email = form.contactEmail
        employee.username = form.contactEmail
        employee.password = form.password
        
        employee.signUpInBackgroundWithBlock{  (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                NSLog("Employee has been created")
                
                self.switchToMainView()
                
            } else {
                // There was a problem, check error.description
                NSLog("ERROR - employee has not been saved")
            }
        }
    }
    
    func switchToMainView() {
        var controller : MainPageFormViewController! = MainPageFormViewController()
        controller.formController.form = MainPageForm()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}