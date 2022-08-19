//
//  IOSExam2App.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-07.
//

import SwiftUI

@main
struct IOSExam2App: App {
    @StateObject private var dataController = DataController();
    
    //Personalisation du navbar.
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear;
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
    }
    var body: some Scene {
        WindowGroup {
            //            PushView()
            ContentView()
                .environmentObject(customerInfo())
                .environmentObject(DragView())
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
