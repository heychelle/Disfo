//
//  GenerateView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct GenerateView: View {
    
    let lauk = ["Seafood", "Poultry", "Meat", "Vegie"]
    let taste = ["Sweet", "Spicy", "Salty", "Bitter"]
    let texture = ["Crunchy", "Creamy", "Cold/Warm", "Mushy", "Slimy"]
    let price = ["<20k", "21k - 35k", "36k - 50k", "51k - 65k", "65k - 80k", " >80k"]
    let location = ["Online", "Offline"]
    
    var body: some View {
        NavigationView{
            VStack{
                Image("discover").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
                Text("Let's make every food that you eat totally worth eat through this discover").font(.system(size: 17)).multilineTextAlignment(.center).foregroundColor(Color(.secondaryLabel)).padding()
                NavigationLink(destination: FoodResultView(), label: {
                    Text("Show me!").bold().foregroundColor(.white).frame(width: 200, height: 45).background(.red).cornerRadius(16)
                })
            }.navigationTitle("Generate")
        }
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
