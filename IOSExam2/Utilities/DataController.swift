//
//  DataController.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-21.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Historique")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
}
