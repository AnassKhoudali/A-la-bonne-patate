//
//  TextViewModifier.swift
//  IOSExam2
//
//  Created by Admin on 2022-04-17.
//

import SwiftUI

struct BillItemsViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.leading)
            .padding(/*@START_MENU_TOKEN@*/[.top, .leading]/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BillSumViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
    }
}


