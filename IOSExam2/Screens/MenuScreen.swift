//
//  MenuScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct MenuScreen: View {
    @EnvironmentObject var dragView : DragView
    @EnvironmentObject var customerInformation : customerInfo;
    @State var bodyOpacity = 0.0
    @State  var isAnimated = false
    @State private var ShowOrdersHistory = false
    @State private var showBill = false
    @State var selectedRows = Set<UUID>()
    @ObservedObject var  menuItemStore: MenuItemStore = MenuItemStore(menuItemData)
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("OrangeColor").opacity(bodyOpacity)
                    .ignoresSafeArea()
                VStack {
                    List(selection: $selectedRows){
                        Section(header: Text("menu principal")){
                            ForEach(menuItemStore.menuItem){
                                item in
                                if(item.type == "main"){
                                    CustumSelectRowView(menuItem: item, selectedItems: self.$selectedRows)
                                        .contextMenu{
                                            VStack{
                                                Button("EN COMBO", action: {
                                                    //                                                    menuItemStore.setToTrue(item)
                                                })
                                                Button("ITEM UNIQUEMENT", action: {
                                                    //                                                  menuItemStore.setToFalse(item)
                                                }
                                                )
                                            }
                                        }
                                    //                                        .listRowBackground(Color("PurpleColor"))
                                }
                            }
                        }
                        
                        Section(header: Text("Boisons")){
                            ForEach(menuItemStore.menuItem){
                                item in
                                if(item.type == "side"){
                                    CustumSelectRowView(menuItem: item, selectedItems: self.$selectedRows)
                                    
                                }
                            }
                            
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .listStyle(GroupedListStyle())
                    .toolbar{
                        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                            VStack {
                                NavigationLink(destination: TabBarScreen(), isActive: $showBill) { EmptyView() }
                                Button{
                                    showBill = true
                                }label:{
                                    PayButton()
                                }
                            }
                            .padding(.bottom, 20.0)
                        }
                        ToolbarItem(placement:ToolbarItemPlacement.navigationBarLeading){
                            Button(action:{
                                ShowOrdersHistory.toggle()
                            },label:{Text("Historique")}
                                   
                            )
                            .foregroundColor(.purple)
                        }
                        
                    }
                    .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: 50)
                        .fill(isAnimated ? Color("DarkGreenColor") : Color("LightGreenColor"))
                        .frame(width: 300, height: 80.0)
                        .overlay(alignment: .center){
                            ZStack {
                                Text("QUITTER")
                            }
                            .font(.system(size:12))
                            .foregroundColor(.black)
                            
                        }
                        .onLongPressGesture(minimumDuration: 1) {
                            withAnimation(.easeInOut){
                                //ici on renitialize le width a sa valeur initiale ce qui nous permet de retourner a la page d'acceuil
                                dragView.width = 78
                                isAnimated.toggle()
                            }
                        } onPressingChanged: { inProgress in
                            withAnimation(.spring()){
                                isAnimated.toggle()
                            }
                        }
                }
                .padding(.top, 1.0)
            }
            .opacity(bodyOpacity)
        }
        .sheet(isPresented: $ShowOrdersHistory){
            HistorySheet()
            
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)){
                bodyOpacity = 1.0
            }
        }
        .opacity(bodyOpacity)
        
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen().environmentObject(customerInfo())
            .environmentObject(DragView())
    }
}
