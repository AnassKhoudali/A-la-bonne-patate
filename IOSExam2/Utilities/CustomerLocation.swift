//
//  CustomerLocation.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-21.
//

import Foundation
import SwiftUI

class customerInfo: ObservableObject{
    @Published var customerLocation = Location.defaultLocations[0]
    @Published var selectedItems : [MenuItem] = []
    @Published var ShowMeTheMenu : Bool = false;
   
    public  func getTotalBeforeTaxes()->Double{
        var totalBT = 0.00;
        self.selectedItems.forEach{
            item in
            totalBT += item.isCombo ? item.priceCombo : item.priceItem
            
        }
        return totalBT
    }
    
    //fonction pour supprimer les items désélectionnés
    public func removeItem(_ id:UUID){
        var i = 0;
        for item in self.selectedItems  {
            if(id == (item.id)){
                self.selectedItems.remove(at: i)
            }
            i += 1
        }
    }
    
    //fonction pour vérifier si l'utilisateur a entré une l'adresse de livraison.
    public func IsValidAddress()->Bool{
        if(self.customerLocation.longitude == Location.defaultLocations[0].longitude && self.customerLocation.latitude == Location.defaultLocations[0].latitude){
            return false
        }
        else{
            return true
        }
    }
    
    //fonction pour vérifier si l'utilisateur a selectionné des items du menu.
    public func SelectionEmpty()->Bool{
        if(self.selectedItems.count == 0){
            return true
        }
        else{
            return false
        }
    }
    
    
}

class DragView: ObservableObject{
    @Published  var width : CGFloat = 78.0
}

