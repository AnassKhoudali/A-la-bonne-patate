//
//  BillScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct BillScreen: View {
    @EnvironmentObject var customerInformation : customerInfo;
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
                VStack {
                    BillView()
                }
                
            }
            .padding(/*@START_MENU_TOKEN@*/.top, 40.0/*@END_MENU_TOKEN@*/)
            .navigationBarHidden(true)
        }
        .environmentObject(customerInformation)
        
    }
}

struct BillScreen_Previews: PreviewProvider {
    static var previews: some View {
        BillScreen().environmentObject(customerInfo())
    }
}
