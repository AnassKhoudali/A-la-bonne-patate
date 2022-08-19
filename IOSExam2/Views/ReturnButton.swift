//
//  ReturnButton.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct ReturnButton: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 90.0, height: 30.0)
                .overlay(alignment: .center){
                    HStack {
                        Image(systemName: "arrow.left")
                        Text("Retour")
                            .font(.callout)
                            .fontWeight(.regular)
                    }
                    .font(.system(size:12))
                    .foregroundColor(.black)
                    
                }
                .accentColor(Color("LightGreenColor"))
                .position(x:60, y:20)
                .padding(.bottom, 20.0)
        }
    }
}

struct ReturnButton_Previews: PreviewProvider {
    static var previews: some View {
        ReturnButton()
    }
}
