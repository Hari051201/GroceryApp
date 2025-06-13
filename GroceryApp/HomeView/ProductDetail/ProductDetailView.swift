import SwiftUI

struct ProductDetailView: View {
    @State var name: String
    @State var price: String
    @State var imageName: String


    @State private var quantity: Int = 1
    @State private var showConfirmation = false

    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color(.systemGray6))
                .cornerRadius(20)

            Text(name)
                .font(.title)
                .fontWeight(.bold)

            Text(price)
                .font(.title3)
                .foregroundColor(.gray)

            HStack {
                Text("Quantity:")
                    .font(.subheadline)
                Spacer()
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                Text("\(quantity)")
                    .font(.title2)
                    .frame(width: 50, alignment: .center)
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)

            Button(action: {
                cartVM.addItem(name: name, price: price, quantity: quantity)
                quantity = 1
                showConfirmation = true
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Added to Cart"),
                    message: Text("\(quantity) \(name)(s) added."),
                    dismissButton: .default(Text("OK"))
                )
            }

            Spacer()
        }
        .padding()
        .navigationTitle(name)
    }
}
