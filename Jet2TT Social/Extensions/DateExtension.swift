//
//  DateExtension.swift
//  Jet2TT Social
//
//  Created by Amin Siddiqui on 26/07/20.
//  Copyright © 2020 svmLogics. All rights reserved.
//

import Foundation

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
