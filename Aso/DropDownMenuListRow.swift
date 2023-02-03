//
//  DropdownMenuListRow.swift
//  DropdownMenu
//
//  Created by Abdelrahman Talaat on 28/11/2022.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let association: Association
    
    /// An action called when user select an action.
    let onSelectedAction: (_ association: Association) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(association)
        }) {
            HStack{
                Text(association.nameAssociation)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(association.logoAssociation)
                    .resizable()
                    .frame(width: 60,height: 60)
                
                
                
            }
               
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(association: Association.testSingleAssociation, onSelectedAction: { _ in })
    }
}
