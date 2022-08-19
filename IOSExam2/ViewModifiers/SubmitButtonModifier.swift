//
//  SubmitButtonModifier.swift
//  IOSExam2
//
//  Created by Admin on 2022-04-20.
//

import SwiftUI

struct SubmitButtonmodifier: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        HStack{
            Text("Soumettre")
            
            Image(systemName: "return.left")
        }
        .foregroundColor(.white)
        .font(.headline)
        .frame(width: 125.0, height: 40.0)
        
        .font(.title)
        .background(isEnabled ? Color("PurpleColor") : Color.gray)
        .foregroundColor(Color("white"))
        .clipShape(Capsule())
        .opacity(configuration.isPressed ||  !isEnabled  ? 0.7 : 1.0)
        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}




