//
//  DateUtils.swift
//  GitHubAPI-Swift
//
//  Created by Matheus Fusco on 25/03/18.
//  Copyright © 2018 Fusco. All rights reserved.
//

import Foundation
import UIKit

class DateUtils: NSObject {
    
    struct DateFormats {
        static let dayFullMonthYear = "dd/MMMM/yyyy"
        static let dayMonthYear = "dd/MM/yyyy"
        static let dayMonthYearWithTime = "dd/MM/yyyy - HH:mm"
        static let dayMonthShortYear = "dd/MM/yy"
        static let dayMonth = "dd/MM"
        static let monthYear = "MM/yy"
        static let yearMonthDay = "yyyy-MM-dd"
        static let fromServer = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let fromServer2 = "yyyy-MM-dd'T'HH:mm:ssZ"
        static let defaultTestDate = "2000-01-01T03:00:00.000+0000"
    }
    
    static func convertDateToString (_ date: String, entryFormat: String = DateFormats.fromServer2, exitFormat: String = DateFormats.dayMonthYearWithTime) -> String {
        let myDate = date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = entryFormat
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let date = dateFormatter.date(from:myDate)!
        dateFormatter.dateFormat = exitFormat
        
        let dateString = dateFormatter.string(from:date)
        return dateString
    }
}
