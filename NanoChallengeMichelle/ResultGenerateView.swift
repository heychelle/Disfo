//
//  ResultGenerateView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct FoodResultView: View {
    
    let lauk = ["Seafood", "Poultry", "Meat", "Vegie"]
    let taste = ["Sweet", "Spicy", "Salty", "Bitter"]
    let texture = ["Crunchy", "Creamy", "Cold/Warm", "Mushy", "Slimy"]
    let price = ["<20k", "21k - 35k", "36k - 50k", "51k - 65k", "65k - 80k", " >80k"]
    let location = ["Online", "Offline"]
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            VStack (){
                let randomLauk = lauk.randomElement()!
                Image(randomLauk).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
                    .padding()

                Text("Food Of The Day").bold().font(.system(size: 24)).padding(.bottom)
                
                HStack (alignment: .center, spacing: 100){
                    VStack {
                        Text(randomLauk).font(.system(size: 17)).multilineTextAlignment(.center)
                        Text("Food Theme").font(.system(size: 10)).multilineTextAlignment(.center).padding(.bottom)
                        let randomTexture = texture.randomElement()!
                        Text(randomTexture).font(.system(size: 17)).multilineTextAlignment(.center)
                        Text("Food Texture").font(.system(size: 10)).multilineTextAlignment(.center).padding(.bottom)
                    }
                    VStack {
                        let randomPrice = price.randomElement()!
                        Text(randomPrice).font(.system(size: 17)).multilineTextAlignment(.center)
                        Text("Price Range").font(.system(size: 10)).multilineTextAlignment(.center).padding(.bottom)
                        let randomTaste = taste.randomElement()!
                        Text(randomTaste).font(.system(size: 17)).multilineTextAlignment(.center)
                        Text("Food Taste").font(.system(size: 10)).multilineTextAlignment(.center).padding(.bottom)
                    }
                }
                    let randomLocation = location.randomElement()!
                            Text(randomLocation == "online" ? "Order melalui delivery (online)" : "Order secara on-site (offline)").font(.system(size: 17)).multilineTextAlignment(.center).padding(.bottom)
            }.navigationTitle("Results")
        }
    }
}

struct FoodResultView_Previews: PreviewProvider {
    static var previews: some View {
        FoodResultView()
    }
}
