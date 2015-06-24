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
        self.title = "We Care and Give Back"
    }
    
    
    func createEventSelector() {
        var controller : CreateEventFormViewController! = CreateEventFormViewController()
        controller?.formController.form = CreateEventForm()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showAllEventsSelector() {
        var controller : EventsTableViewController = EventsTableViewController()
        controller.filter = "All"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showNextWeeksEventsSelector() {
        var controller : EventsTableViewController = EventsTableViewController()
        controller.filter = "NextWeek"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showPopularEventsSelector() {
        var controller : EventsTableViewController = EventsTableViewController()
        controller.filter = "Popular"
        self.navigationController?.pushViewController(controller, animated: true)
    }
}