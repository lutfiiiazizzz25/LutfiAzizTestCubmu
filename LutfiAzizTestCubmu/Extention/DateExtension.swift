//
//  DateExtension.swift
//  LutfiAzizTestCubmu
//
//  Created by Lutfi Aziz on 06/06/23.
//

import Foundation

func convertDateFormat(inputDate: String) -> String {

     let olDateFormatter = DateFormatter()
     //olDateFormatter.dateFormat = "yyyy-MM-dd "

     olDateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"

     let oldDate = olDateFormatter.date(from: inputDate)

     let convertDateFormatter = DateFormatter()
     convertDateFormatter.dateFormat = "dd MMMM yyyy"
     convertDateFormatter.locale = Locale(identifier: "id")
     return convertDateFormatter.string(from: oldDate!)
}
