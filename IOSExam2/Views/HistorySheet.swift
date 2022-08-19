//
//  HistorySheet.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-17.
//

import SwiftUI

struct HistorySheet: View {
    @FetchRequest(sortDescriptors: []) var commandes: FetchedResults<Commande>
    @Environment(\.presentationMode) var presentationmode:Binding<PresentationMode>
    @State var isThereAnyOrders = false
    var body: some View {
        ZStack{
            Color("PurpleColor")
                .ignoresSafeArea()
            VStack{
                HStack(alignment: .center){
                    Text("Historique de commandes")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Button(action: {
                        self.presentationmode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width:28, height:28)
                            .offset(x:0, y:-15)
                            .foregroundColor(Color("OrangeColor"))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                if(commandes.count>0){
                    ScrollView{
                        VStack {
                            ForEach(commandes){
                                item in
                                HStack{
                                    Text("Nb de commandes: \(item.numero ?? "")")
                                        
                                }
                                HStack{
                                    Text("# \(item.numero ?? "")")
                                        .font(.title)
                                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                    VStack{
                                        Text("Date: \(item.numero ?? "")")
                                        Text("Total: \(String(format: "%.2f", item.total))")
                                    }
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                if(commandes.count == 0){
                    Spacer()
                    Text("Acune commande Passée.")
                        .font(.title3)
                    
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
        }
    }
}

struct HistorySheet_Previews: PreviewProvider {
    static var previews: some View {
        HistorySheet()
    }
}
