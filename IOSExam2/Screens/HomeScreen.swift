//
//  HomeScreen.swift
//  IOSExam2
//
//  Created by ANASS KHOUDALI on 2022-04-23.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var customerInformation : customerInfo
    @EnvironmentObject var dragView : DragView
    @State var opacity = 0.0
    @State var translateY = 50
    @State var maxWidth: CGFloat = 375
    @State var translationWidth: CGFloat = 0
    @State var lastDragValue: CGFloat = 0
    @State var position: CGFloat = 0
    
    var body: some View {
        //L'utilisateur dois glisser jusqu'a la fin du slider pour pouvoir aller à la page suivante.
       
        ZStack{
           Color("AccentColor").opacity(opacity)
                .ignoresSafeArea()
            VStack(alignment: .center){
               
                Spacer()
                Text("Bienvenue.")
                    .font(.system(size:60))
                    .fontWeight(.heavy)
                    .opacity(opacity)
                    .offset(y: CGFloat(translateY))
                
                
                Image("_logo")
                    .resizable()
                    .frame(width:.infinity, height:300, alignment:.center)
                    .clipShape(RoundedRectangle(cornerRadius: 90))
                    .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(Color("PurpleColor"), lineWidth: 3)
                    )
                
                Text("C'est comme \n manger à la maison.")
                    .multilineTextAlignment(.center)
                    .frame(width: .infinity, height: 200.0)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-80.0/*@END_MENU_TOKEN@*/);
                HStack{
                    Rectangle()
                        .fill(Color(.white).opacity(0.20))
                    
                        .frame(width:.infinity, height:80)
                        .cornerRadius(35)
                        .overlay(alignment: .center){
                            Text("Commander")
                                .fontWeight(.bold)
                                .frame(width:360, height:70)
                                .background(Color(.white).opacity(0.40))
                                .cornerRadius(35)
                        }
                    
                        .overlay(alignment: .leading){
                            Rectangle()
                                .fill(Color("LightGreenColor"))
                                .cornerRadius(35)
                                .offset(x:position/2)
                                .frame(width: dragView.width, height:78)
                            
                                .overlay(alignment: .trailing){
                                    ZStack {
                                        
                                        Color("DarkGreenColor")
                                        Image(systemName: "chevron.forward.2")
                                            .font(.system(size:40))
                                        
                                    }
                                    
                                    .frame(width: 70.0, height: 70.0)
                                    .cornerRadius(35)
                                    .offset(x: position - 4)
                                    .gesture(DragGesture(minimumDistance:0).onChanged({(value) in
                                        
                                        //recuperation de la postion du doigt
                                        let translation = value.translation
                                        translationWidth = translation.width
                                        let move =  translationWidth + lastDragValue;
                                        position = move < 0 ? 0 : move > maxWidth ? maxWidth : move;
                                        lastDragValue = position;
                                        
                                        dragView.width += lastDragValue + dragView.width < 0 ? 78 : lastDragValue + dragView.width > maxWidth ?  maxWidth : lastDragValue;
                                    }).onEnded({(value) in
                                        lastDragValue = position
                                        
                                    })
                                    )}
                                .frame(width:.infinity, height: 80)
                            
                        }
                    
                }
                .onAppear(perform:{
                    withAnimation(.easeInOut(duration: 1)){
                        translateY = 0
                    }
                })
                .opacity(opacity)
                .offset(y: CGFloat(translateY))
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal, 10.0/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .opacity(opacity)
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 0.5)){
                    opacity = 1.0
                }
            })
        }
       
}
}
struct HomeScreen_Previews: PreviewProvider {
    var push: Bool = false
    static var previews: some View {
        HomeScreen()
            .environmentObject(customerInfo())
            .environmentObject(DragView())
    }
}

