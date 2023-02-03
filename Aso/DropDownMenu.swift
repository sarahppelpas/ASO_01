import SwiftUI

struct DropdownMenu: View {
    /// Used to show or hide drop-down menu options
    @State private var isAssociationsPresented: Bool = false
    
    /// Used to bind user selection
 
    @Binding var selectedAssociation: Association?
    
    /// A placeholder for drop-down menu
    let placeholder: String
    
    /// The drop-down menu options
    let associations: [Association]
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isAssociationsPresented.toggle()
            }
        }) {
            HStack {
                Text(selectedAssociation == nil ? placeholder : selectedAssociation!.nameAssociation)
                    .fontWeight(.medium)
                    .foregroundColor(selectedAssociation == nil ? .gray : .black)
                
                Spacer()
                
                Image(systemName: self.isAssociationsPresented ? "chevron.up" : "chevron.down")
                    // This modifier available for Image since iOS 16.0
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 2)
        }
        .overlay(alignment: .top) {
            VStack {
                if self.isAssociationsPresented {
                    Spacer(minLength: 60)
                    DropdownMenuList(associations: self.associations) { association in
                        self.isAssociationsPresented = false
                        self.selectedAssociation = association
                    }
                }
            }
        }
        .padding(.horizontal)
        // We need to push views under drop down menu down, when options list is
        // open
        .padding(
            // Check if options list is open or not
            .bottom, self.isAssociationsPresented
            // If options list is open, then check if options size is greater
            // than 300 (MAX HEIGHT - CONSTANT), or not
            ? CGFloat(self.associations.count * 32) > 300
                // IF true, then set padding to max height 300 points
                ? 300 + 30 // max height + more padding to set space between borders and text
                // IF false, then calculate options size and set padding
                : CGFloat(self.associations.count * 32) + 30
            // If option list is closed, then don't set any padding.
            : 0
        )
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(
            selectedAssociation: .constant(nil),
            placeholder: "Selectionne ton association",
            associations: Association.testAllAssociation
        )
    }
}
