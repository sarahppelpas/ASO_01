import SwiftUI

struct FourTextFields: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var text4 = ""

    var body: some View {
        VStack {
            TextField("Nom...", text: $text1)
                .padding()
            Divider()
            TextField("Prénom...", text: $text2)
                .padding()
            Divider()
            TextField("Date de naissance...", text: $text3)
                .padding()
            Divider()
            TextField("Mail...", text: $text4)
                .padding()
            Divider()
        }
        
    }
}


struct FourTextFields_Previews: PreviewProvider {
    static var previews: some View {
        FourTextFields()
    }
}
