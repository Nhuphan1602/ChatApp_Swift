//
//  Date.swift
//  ChatAppSwiftUI
//
//  Created by Phan Tam Nhu on 22/5/24.
//

import Foundation

extension Date {
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    func timeString() -> String {
        timeFormatter.string(from: self)
    }
    
    func dateString() -> String {
        dayFormatter.string(from: self)
    }
    
    func chatTimestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return "Today"
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            return dateString()

        }
    }
    
    func timeStampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return timeString()
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            return dateString()
        }
    }
}
