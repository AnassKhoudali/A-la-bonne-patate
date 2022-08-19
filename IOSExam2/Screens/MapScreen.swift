//
//  MapScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-20.
//

import SwiftUI

struct MapScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color("OrangeColor")
                .ignoresSafeArea()
            VStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                    
                }label:{
                    ReturnButton()
                }
            }
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack{
                    MapView()
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.top, 40.0/*@END_MENU_TOKEN@*/)
            .navigationBarHidden(true)
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
        
    }
}
