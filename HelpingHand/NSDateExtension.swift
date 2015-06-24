//
//  NSDateExtension.swift
//  HelpingHand
//
//  Created by Felton, Jenner on 6/19/15.
//  Copyright (c) 2015 Felton, Jenner. All rights reserved.
//

import Foundation

public extension NSDate {
    func xDays(x:Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitDay, value: x, toDate: self, options: nil)!
    }
    func xWeeks(x:Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit(.CalendarUnitWeekOfYear, value: x, toDate: self, options: nil)!
    }
    var hoursFromToday: Int{
        return NSCalendar.currentCalendar().components(.CalendarUnitHour, fromDate: self, toDate: NSDate(), options: nil).hour
    }
    var weeksFromToday: Int{
        return NSCalendar.currentCalendar().components(.CalendarUnitWeekOfYear, fromDate: self, toDate: NSDate(), options: nil).weekOfYear
    }
    var relativeDateString: String {
        if weeksFromToday > 0 { return weeksFromToday > 1 ? "\(weeksFromToday) weeks and \(hoursFromToday) hours" : "\(weeksFromToday) week and \(hoursFromToday) hours"   }
        if hoursFromToday > 0 { return hoursFromToday > 1 ? "\(hoursFromToday) hours" : "\(hoursFromToday) hour"   }
        return ""
    }
}
let today              = NSDate()                  // "Dec 7, 2014, 9:32 PM"
let yesterday          = NSDate().xDays(-1)        // "Dec 6, 2014, 9:32 PM"
let twoWeeksAgo        = NSDate().xWeeks(-2)       // "Nov 23, 2014, 9:32 PM"
let date4              = NSCalendar.currentCalendar().dateWithEra(1, year: 2013, month: 12, day: 4, hour: 0, minute: 0, second: 0, nanosecond: 0)!  // "Dec 4, 2013, 12:00 AM"
let date5              = NSCalendar.currentCalendar().dateWithEra(1, year: 2012, month: 12, day: 3, hour: 0, minute: 0, second: 0, nanosecond: 0)!  // "Dec 3, 2012, 12:00 AM"
