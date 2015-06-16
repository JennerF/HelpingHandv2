//
//  MainPageFormViewController.swift
//
//  Created by Jenner Felton on 06/15/2015.
//  Copyright (c) 2015 Jenner Felton. All rights reserved.
//

import UIKit

class MainPageFormViewController: FXFormViewController {
    
    override func awakeFromNib() {
        formController.form = MainPageForm()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    
    func createEventSelector() {
        var controller: CreateEventFormViewController! = CreateEventFormViewController()
        controller?.formController.form = CreateEventForm()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //func showAllEventsSelector() {
      //  var controller: EventsViewController! = EventsViewController()
        //self.navigationController?.pushViewController(controller, animated: true)
    //}
    
    
}