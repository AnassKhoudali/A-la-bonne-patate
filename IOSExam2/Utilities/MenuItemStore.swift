//
//  MenuItemStore.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-10.
//

import Foundation
import SwiftUI

class MenuItemStore: ObservableObject {
    
    @Published var menuItem: [MenuItem]
    
    init(_ menuItem: [MenuItem] = []){
        self.menuItem = menuItem
    }
    
    
    public func setToTrue(_ menuItem: inout MenuItem){
        objectWillChange.send()
        menuItem.isCombo = true
    }
    
    public func setToFalse(_ menuItem: inout MenuItem){
        objectWillChange.send()
        menuItem.isCombo = false
    }
    
    public static func getSelectedItems(_ menuItems : MenuItemStore,_ ids :  Set<UUID>)->[MenuItem]{
        var selectedItems : [MenuItem] = []
        for item in menuItems.menuItem  {
            if(ids.contains(item.id)){
                selectedItems.append(item)
            }
            
        }
        return selectedItems
    }
    
    public func getSelectedItem(_ id :  UUID)->MenuItem?{
        for item in self.menuItem {
            if(id == (item.id)){
                return item
            }
        }
        return nil
    }
    
    public static func getTotalBeforeTaxes(_ menuItems : [MenuItem])->Double{
        var totalBT = 0.00;
        menuItems.forEach{
            item in
            totalBT += item.isCombo ? item.priceCombo : item.priceItem
            
        }
        return totalBT
    }
}
