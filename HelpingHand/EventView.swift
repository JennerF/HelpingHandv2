//
//  EventView.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/16/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import UIKit

class EventView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blueColor()
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func addTitle(title : String) {
        var titleLabel : UILabel = UILabel(frame: CGRectMake(0, 0, 100, 20))
        titleLabel.center = CGPointMake(center.x, center.y + 80)
        titleLabel.text = title
        addSubview(titleLabel)
    }
    
    
    func addEventImage(eventImage : UIImage) {
        var eventImageView : UIImageView = UIImageView(frame: CGRectMake(50, 50, 50, 50))
        eventImageView.image = eventImage
        addSubview(eventImageView)
    }
    
    
    func addEventDescription(eventDescription : String) {
        var eventDescriptionView : UITextView = UITextView(frame: CGRectMake(50,100, 100, 100))
        eventDescriptionView.center = CGPointMake(center.x, center.y)
        eventDescriptionView.text = eventDescription
        eventDescriptionView.editable = false
        addSubview(eventDescriptionView)
    }
}
