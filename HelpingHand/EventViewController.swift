//
//  EventViewController.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/16/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    var event : VolunteerEvent!
    var screenWidth : CGFloat = 0
    var screenHeight : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize : CGRect = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        addEventSubview()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addEventSubview() {
        var eventView : EventView = EventView(frame: CGRectMake(0.0,0.0,screenWidth,screenHeight))
        eventView.addTitle(event.eventName)
        eventView.addEventDescription(event.eventDescription)
        eventView.addEventImage(event.getImage())
        self.view.addSubview(eventView)
        NSLog("We are creating a view")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
