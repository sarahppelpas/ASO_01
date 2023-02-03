//
//  ContentView.swift
//  DropdownMenu
//
//  Created by Abdelrahman Talaat on 28/11/2022.
//

import SwiftUI

struct EcranDon: View {
    @State private var birthMonth: Association? = nil
    
    var body: some View {
        ScrollView {
        VStack{
            VStack {
            
                VStack{
                    Text(" 1. Choisi une association")
                        .padding()
                        .font(.headline)
                    
                    
                }
                
                DropdownMenu(
                    selectedAssociation: self.$birthMonth,
                    placeholder: "Choisi une association",
                    associations: Association.testAllAssociation
                )
                
                Image(birthMonth?.logoAssociation ?? "")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text(" 2. Choisi le montant du don.")
                    .padding()
                    .font(.headline)
            }
            ZStack{
                
                CounterView()
            }
            
        
            
            VStack{
                FourTextFields()
                
            }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EcranDon()
    }
}
