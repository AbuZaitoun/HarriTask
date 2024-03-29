//
//  Availability.swift
//  HarriIosTask
//
//  Created by Anas AbuZaitoun on 19/04/2021.
//

import Foundation

/// Availability
struct Availability: Codable {
    
    /// Any time
    var anytime: Bool = false
    
    /// Friday afternoon
    var friday_afternoon: Bool = false
    
    /// Friday evenin
    var friday_evening: Bool = false
    
    /// Friday morning
    var friday_morning: Bool = false
    
    /// Fulltime
    var full_time: Bool = false
    
    /// Monday afternoon
    var monday_afternoon: Bool = false
    
    /// Monday evening
    var monday_evening: Bool = false
    
    /// Monday morning
    var monday_morning: Bool = false
    
    /// Part time
    var part_time: Bool = false
    
    /// Saturday afternoon
    var saturday_afternoon: Bool = false
    
    /// Saturday evening
    var saturday_evening: Bool = false
    
    /// Saturday morning
    var saturday_morning: Bool = false
    
    /// Sunday afternoon
    var sunday_afternoon: Bool = false
    
    /// Sunday evening
    var sunday_evening: Bool = false
    
    /// Sunday mornning
    var sunday_morning: Bool = false
    
    /// Thursday afternoon
    var thursday_afternoon: Bool = false
    
    /// Thursday evening
    var thursday_evening: Bool = false
    
    /// Thursday morning
    var thursday_morning: Bool = false
    
    /// Tuesday afternoon
    var tuesday_afternoon: Bool = false
    
    /// Tuesday evening
    var tuesday_evening: Bool = false
    
    /// Tuesday morning
    var tuesday_morning: Bool = false
    
    /// Wednesday afternoon
    var wednesday_afternoon: Bool = false
    
    /// Wednesday evening
    var wednesday_evening: Bool = false
    
    /// Wednesday morning
    var wednesday_morning: Bool = false
    
    /// Weekdays
    var weekdays: Bool = false
    
    /// Weekend days
    var weekend_days: Bool = false
    
    /// Weekend nights
    var weekend_nights: Bool = false
    
    /// Week nights
    var weeknights: Bool = false
    
    /// Availabilities
    var availabilities: [(String, Bool)] {
        var toReturn:[(title: String, value: Bool)] = []
        toReturn.append((title: "AnyTime", value: self.anytime))
        toReturn.append((title: "Friday Afternoon", value: self.friday_afternoon))
        toReturn.append((title: "Friday Evening", value: self.friday_evening))
        toReturn.append((title: "Friday Morning", value: self.friday_morning))
        toReturn.append((title: "Full Time", value: self.full_time))
        toReturn.append((title: "Monday Afternoon", value: self.monday_afternoon))
        toReturn.append((title: "Monday Evening", value: self.monday_evening))
        toReturn.append((title: "Monday Morning", value: self.monday_morning))
        toReturn.append((title: "Part Time", value: self.part_time))
        toReturn.append((title: "Saturday Afternoon", value: self.saturday_afternoon))
        toReturn.append((title: "Saturday Evening", value: self.saturday_evening))
        toReturn.append((title: "Saturday Morning", value: self.saturday_morning))
        toReturn.append((title: "Sunday Afternoon", value: self.sunday_afternoon))
        toReturn.append((title: "Sunday Evening", value: self.sunday_evening))
        toReturn.append((title: "Sunday Morning", value: self.sunday_morning))
        toReturn.append((title: "Thursday Afternoon", value: self.thursday_afternoon))
        toReturn.append((title: "Thursday Evening", value: self.thursday_evening))
        toReturn.append((title: "Thursday Morning", value: self.thursday_morning))
        toReturn.append((title: "Tuesday Afternoon", value: self.tuesday_afternoon))
        toReturn.append((title: "Tuesday Evening", value: self.tuesday_evening))
        toReturn.append((title: "Tuesday Morning", value: self.tuesday_morning))
        toReturn.append((title: "Wednesday Afternoon", value: self.wednesday_afternoon))
        toReturn.append((title: "Wednesday Evening", value: self.wednesday_evening))
        toReturn.append((title: "Wednesday Morning", value: self.wednesday_morning))
        toReturn.append((title: "Weekdays", value: self.weekdays))
        toReturn.append((title: "Weekend Days", value: self.weekend_days))
        toReturn.append((title: "Weekend Nights", value: self.weekend_nights))
        toReturn.append((title: "Weeknights", value: self.weeknights))
        return toReturn
    }

    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case anytime
        case friday_afternoon
        case friday_evening
        case friday_morning
        case full_time
        case monday_afternoon
        case monday_evening
        case monday_morning
        case part_time
        case saturday_afternoon
        case saturday_evening
        case saturday_morning
        case sunday_afternoon
        case sunday_evening
        case sunday_morning
        case thursday_afternoon
        case thursday_evening
        case thursday_morning
        case tuesday_afternoon
        case tuesday_evening
        case tuesday_morning
        case wednesday_afternoon
        case wednesday_evening
        case wednesday_morning
        case weekdays
        case weekend_days
        case weekend_nights
        case weeknights
    }
}
