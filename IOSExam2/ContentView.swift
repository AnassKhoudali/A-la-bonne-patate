//
//  ContentView.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-07.
//

import SwiftUI
struct ContentView: View {
    @StateObject var customerInformation : customerInfo = customerInfo()
    @StateObject var dragView : DragView = DragView()
    
    var body: some View{
        ZStack {
            if (dragView.width >= 370) {
                withAnimation(.easeInOut(duration: 1.0)){
                    MenuScreen()
                        .transition(.opacity)
                }
            }
            
            else{
                withAnimation(.easeInOut(duration: 1.0)){
                    HomeScreen()
                }
            }
        }
        .environmentObject(customerInformation)
        .environmentObject(dragView)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(customerInfo())
            .environmentObject(DragView())
    }
    
}


