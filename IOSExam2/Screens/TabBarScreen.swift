//
//  TabBarScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct TabBarScreen: View {
    var body: some View {
        TabView{
            BillScreen()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Facture")
                }
            MapScreen()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Livraison")
                }
            OrderScreen()
                .tabItem {
                    Image(systemName: "dollarsign.square.fill")
                    Text("Paiement")
                }
                .navigationBarHidden(true)
            
        }
        .statusBar(hidden: true)
        .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct TabBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabBarScreen().environmentObject(customerInfo())
    }
}
