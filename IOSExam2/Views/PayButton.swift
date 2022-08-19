//
//  PayButton.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct PayButton: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 80.0, height: 30.0)
                .overlay(alignment: .center){
                    HStack {
                        Image(systemName: "cart")
                        Text("PAYER")
                    }
                    .font(.system(size:12))
                    .foregroundColor(.black)
                    
                }
                .accentColor(Color("LightGreenColor"))
        }
    }
}


