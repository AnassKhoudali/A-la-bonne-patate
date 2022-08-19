//
//  CustumSelectRowView.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-15.
//

import SwiftUI

struct CustumSelectRowView : View {
    @EnvironmentObject var  customerInformation: customerInfo
    @ObservedObject var menuItemStore: MenuItemStore = MenuItemStore(menuItemData)
    var menuItem: MenuItem
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool {
        selectedItems.contains(menuItem.id)
    }
    @State var hilightColor : Color = Color.white
    
    
    var body: some View {
        ZStack {
            HStack {
                Text(self.menuItem.name)
                Spacer()
                if(self.menuItem.isCombo){
                    Image(systemName: "bag.badge.plus")
                    
                }
                if self.isSelected {
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.blue)
                    
                }
            }
            .onTapGesture(count: 2, perform:{
                if self.isSelected {
                    self.selectedItems.remove(self.menuItem.id)
                    customerInformation.removeItem(self.menuItem.id)
                } else {
                    self.selectedItems.insert(self.menuItem.id)
                    guard let SelectedItem = menuItemStore.getSelectedItem(self.menuItem.id) else{
                        print("No Item was found!")
                        return
                    }
                    customerInformation.selectedItems.append(SelectedItem)
                    
                }
                
            })
        }
        
        //        .listRowBackground(hilightColor)
        
    }
}


