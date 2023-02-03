import SwiftUI

struct CounterView: View {
    @State private var count = 0 {
        didSet {
            if count < 0 {
                count = 0
            }
        }
    }
    
    var body: some View {
        VStack {
           
            HStack {
                Button(action: { self.count -= 1 }) {
                    Text("-")
                        .padding()
                        .font(.title)
                }
                VStack{
                    Text("\(count) €")
                .font(.title)
                .padding()
                    
                    
              
                }
                Button(action: { self.count += 1 }) {
                    Text("+")
                        .padding()
                        .font(.title)
                }
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
