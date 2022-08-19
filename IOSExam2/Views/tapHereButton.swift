//
//  tapHereButton.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-19.
//

import SwiftUI

struct tapHereButton: View {
    @State var wasTapped = false
    @State var size : CGFloat = 150
    @State var opacity = 1.0
    @State var xPosition : CGFloat = -60.0
    
    var body: some View {
        Button{
            wasTapped = true
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)){
                xPosition = 60
            }
        }label:{
            VStack{
                Circle()
                    .stroke(Color(.cyan).opacity(opacity), lineWidth: 3)
                    .frame(width: size, height: size)
                    .overlay(alignment: .center){
                        ZStack {
                            Circle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color("PurpleColor"))
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
                            Text(!wasTapped ? "Cliquez ici" : "C'est gratuit!!")
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        
                    }
                    .accentColor(Color("PurpleColor"))
                
            }
            .onAppear{
                withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: false)){
                    size = 250
                    opacity = 0.0
                }
            }
        }
        .offset(x: xPosition)
    }
}





struct tapHereButton_Previews: PreviewProvider {
    static var previews: some View {
        tapHereButton()
    }
}
