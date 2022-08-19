//
//  DateTest.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-16.
//

import SwiftUI

struct DateToday: View {
    @State var dayNow =  Date.now.formatted(.dateTime.day())
    @State var monthNow =  "\(Date.now.formatted(.dateTime.month(.defaultDigits)))"
    @State var yearNow =  Date.now.formatted(.dateTime.year())
    
    var body: some View {
        Text("\(dayNow)  "+getMonthInFrench()+" \(yearNow) ")
            .padding(5)
    }
    func getMonthInFrench() -> String{
        switch monthNow {
        case "1":
            return "janvier"
        case "2":
            return "février"
        case "3":
            return "mars"
        case "4":
            return "avril"
        case "5":
            return "mai"
        case "6":
            return "juin"
        case "7":
            return "juiellet"
        case "8":
            return "aout"
        case "9":
            return "september"
        case "10":
            return "octobre"
        case "11":
            return "novembre"
        case "12":
            return "décembre"
        default:
            return "Error"
        }
    }
}


