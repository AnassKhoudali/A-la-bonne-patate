//
//  OrderButtonModifier.swift
//  IOSExam2
//
//  Created by Admin on 2022-04-19.
//

import SwiftUI

struct OrderButtonModifier: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        
            .padding(.vertical, 20.0)
            .padding(.horizontal, 50.0)
            .font(.title)
            .background(Color("LightGreenColor") )
            .foregroundColor(configuration.isPressed ||  isEnabled  ? .black : Color("DarkGreenColor"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ||  !isEnabled  ? 0.5 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        
    }
}



