//
//  ContentView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct ContentView: View {
    
    
    //persisting the bool to user defaults
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true

//    @State var shouldShowOnboarding: Bool = true
    
    var body: some View {
        TabView{
            ReportView().tabItem{Image(systemName: "chart.pie.fill")
                    Text("Report")
                }
            GenerateView().tabItem{Image(systemName: "dice.fill")
                    Text("Generate")
                }
            TransactionView().tabItem{Image(systemName: "list.dash")
                    Text("Transactions")
                }

        }.accentColor(Color("Red")).fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnBoardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnBoardingView: View{
    @Binding var shouldShowOnboarding: Bool

    var body: some View{
        TabView{
            PageView(
                title: "Generate", message: "We will accompany you to discover new food in your every dish", imageName: "p1", showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding
            )
            PageView(
                title: "Track", message: "Helps you keep a record of each of your meals, so that each food has a valuable meaning", imageName: "p2", showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding
            )
            PageView(
                title: "Memorable", message: "You can look back on your food discoveries, and maybe it can help you in the future", imageName: "p3", showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)
            PageView(
                title: "Disfo", message: "Totally Worth Eat!", imageName: "Disfo", showsDismissButton: true, shouldShowOnboarding: $shouldShowOnboarding)

        }.tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View{
    let title: String
    let message: String
    let imageName: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool


    var body: some View{
        VStack{
            Image(imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
                .padding()
            Text(title).fontWeight(.semibold).font(.system(size: 32)).padding()
            Text(message).font(.system(size: 18)).multilineTextAlignment(.center).foregroundColor(Color(.secondaryLabel)).padding()

            if showsDismissButton{
                Button(action: {
                    shouldShowOnboarding.toggle()
                }, label: {
                    Text("Get Started").bold().foregroundColor(.white).frame(width: 200, height: 50).background(.red).cornerRadius(20)
                })
            }
        }.onAppear()
    }
}
