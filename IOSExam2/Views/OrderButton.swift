//
//  OrderButton.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-18.
//

import SwiftUI

struct OrderButton: View {
    @FetchRequest(sortDescriptors: []) var commandes: FetchedResults<Commande>
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var customerInformation : customerInfo;
    @Binding var orderSentSuccessfully : Bool
    var body: some View {
        VStack {
            VStack{
                //Si l'utilisateur ne selectionne aucun item.
                if(customerInformation.SelectionEmpty()){
                    Text("🍔 - Acun item sélectionné.")
                        .frame(height:25)
                }
                //Si l'utilisateur ne fournit pas d'adresse de livraison.
                if(!customerInformation.IsValidAddress()){
                    Text("🚗 - Adresse invalide.")
                        .frame(height:25)
                }
            }
            .foregroundColor(Color.red)
            Button("Commander!!") {
                let commande = Commande(context: moc)
                commande.id = UUID()
                commande.date = Date.now
                //On ajoute 1 car le count commence a zero (on ne peut pas afficher a l'utilisateur element numero 0).
                commande.numero = "\(commandes.count+1)"
                commande.total = customerInformation.getTotalBeforeTaxes()*(1.15)
                orderSentSuccessfully.toggle()
            }
            .buttonStyle(OrderButtonModifier())
            .disabled(!customerInformation.IsValidAddress()||customerInformation.SelectionEmpty())
            
            
        }
    }
}


