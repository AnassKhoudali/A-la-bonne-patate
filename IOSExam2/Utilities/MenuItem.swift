//
//  MenuItem.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-10.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id: UUID
    var name: String
    var type: String
    var isCombo: Bool
    var isSelected: Bool
    var priceItem: Double
    var priceCombo: Double
    
    public  func ToString()->String{
        
        return "-- \(self.name.capitalized) [item] ... $\(self.isCombo ? self.priceCombo : self.priceItem)"
    }
}


