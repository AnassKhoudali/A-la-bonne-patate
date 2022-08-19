//
//  BillView.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct BillView: View {
    @EnvironmentObject var customerInformation : customerInfo;
    var body: some View {
        VStack {
            VStack{
                Text("À la bonne patate")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    .frame(height: 50.0)
                DateToday()
                Spacer()
                ScrollView{
                    ForEach(customerInformation.selectedItems){
                        item in
                        Text("\(item.ToString())")
                            .modifier(BillItemsViewModifier())
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: 400)
                Divider()
                Spacer()
                VStack{
                    
                    HStack {
                        Text("Total avant taxes: ")
                            .fontWeight(.bold)
                        Text("$\(self.getPriceBeforetaxes()[0])")
                    }
                    .modifier(BillSumViewModifier())
                    HStack {
                        Text("Taxes: ")
                            .fontWeight(.bold)
                        Text("$\(self.getPriceBeforetaxes()[1])")
                    }
                    .modifier(BillSumViewModifier())
                    HStack {
                        Text("Montant total: ")
                            .fontWeight(.bold)
                        Text("$\(self.getPriceBeforetaxes()[2])")
                    }
                    .modifier(BillSumViewModifier())
                }
                .padding(.bottom)
            }
            .padding(.all, 5.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .border(Color("OrangeColor"), width: 2)
        }
        .padding(.all)
    }
    func getPriceBeforetaxes()-> [String]{
        let priceDouble = MenuItemStore.getTotalBeforeTaxes(customerInformation.selectedItems);
        let price = String(format: "%.2f", priceDouble)
        let taxes = String(format: "%.2f", priceDouble*0.15)
        let priceWithTaxes = String(format: "%.2f", priceDouble*1.15)
        
        return [price, taxes, priceWithTaxes]
    }
}



struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView().environmentObject(customerInfo())
    }
}
