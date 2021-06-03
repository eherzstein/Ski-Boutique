//
//  OrderBasketView.swift
//  eBoutique
//
//  Created by Erin Herzstein on 2021-05-21.
//  Copyright © 2021 Erin Herzstein. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct OrderBasketView: View {
    @ObservedObject var basketListener = BasketListener()
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(self.basketListener.orderBasket?.items ?? []) { article in
                        
                        VStack {
                            HStack {
                                                        Text(article.name)
                                                        Spacer()
                                                        Text("$\(article.price.clean)")
                                                    }//Fin de HStack
                            Image(article.imageName)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 170)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        } // Fin de VStack
                        
                    }//Fin de ForEach
                        .onDelete { (indexSet) in
                            self.deleteItems(at: indexSet)
                    }
                }
                Section {
                    //Mettre le lien vers le checkout
                    NavigationLink(destination: CheckoutView())
                    {
                        Text("Place Order")
                        
                    }
               //unactivated if the basket is empty
                    
                }.disabled(self.basketListener.orderBasket?.items.isEmpty ?? true)
            } //Fin List
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
        } //Fin Navigation view
    }
    func deleteItems(at offsets: IndexSet) {
        self.basketListener.orderBasket.items.remove(at: offsets.first!)
        self.basketListener.orderBasket.saveBasketToFirestore()
    }
}
@available(iOS 14.0, *)
struct OrderBasketView_Previews: PreviewProvider {
    static var previews: some View {
        OrderBasketView()
    }
}
