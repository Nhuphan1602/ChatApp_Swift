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
    
    func chatTimestampString() -> String {
        if Calendar.current.isDateInToday(self) {
            return "Today"
        } else if Calendar.current.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            return dayFormatter.string(from: self)

        }
    }
}
