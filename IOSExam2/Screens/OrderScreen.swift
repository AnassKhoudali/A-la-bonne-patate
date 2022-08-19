//
//  OrderScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-19.
//

import SwiftUI

struct OrderScreen: View {
    @State var orderSentSuccessfully = false
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
                    Spacer()
                    tapHereButton()
                    Spacer()
                    OrderButton(orderSentSuccessfully: $orderSentSuccessfully)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.top, 40.0/*@END_MENU_TOKEN@*/)
            .navigationBarHidden(true)
            .alert(isPresented: $orderSentSuccessfully){
                Alert(
                    title:Text("C'est envoyé."),
                    message:(Text("La commande a été envoyé avec succès.")),
                    dismissButton:  .default(Text("Retour").foregroundColor(.blue)
                        , action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                )
                
            }
        }
    }
}
struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen()
            .environmentObject(customerInfo())
    }
}
