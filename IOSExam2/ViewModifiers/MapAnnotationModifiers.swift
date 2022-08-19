//
//  MapAnnotationModifiers.swift
//  IOSExam2
//
//  Created by Admin on 2022-04-21.
//

import SwiftUI

struct RestorantsAnnotationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
            .frame(width: 44, height: 44)
            .background(.white)
            .clipShape(Circle())
    }
}



struct CustomersAnnotationModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .frame(width: 44, height: 44)
            .background(.white)
            .clipShape(Circle())
    }
}
