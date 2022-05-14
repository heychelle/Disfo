//
//  AddReportView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct TextInputField: View{
    var placeholderText: String
    @Binding var text: String
    
    init(_ placeholderText: String, text: Binding<String>){
        self.placeholderText = placeholderText
        self._text = text
    }
    
    var body: some View{
        ZStack (alignment: .leading){
            Text(placeholderText).foregroundColor(text.isEmpty ? Color(.placeholderText) : Color("Red"))
                .offset(y: text.isEmpty ? 0: -25)
                .scaleEffect(text.isEmpty ? 1: 0.8, anchor: .leading)
            TextField("", text: $text)
        }
        .padding().padding(.top, 5).background(.gray.opacity(0.2)).cornerRadius(10).font(.system(size: 17))
        .animation(.default)
    }
}

struct BiayaInputField: View {
    var placeholderBiaya: String
    @Binding var biaya: Int32

    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        return formatter
    }()

    init(_ placeholderBiaya: String, biaya: Binding<Int32>) {
        self.placeholderBiaya = placeholderBiaya
        self._biaya = biaya
    }

    var body: some View {
        ZStack(alignment: .leading) {
            // diff nya hanya di syarat dan tipe data
            Text(placeholderBiaya).foregroundColor(biaya == 0 ? Color(.placeholderText) : Color("Red"))
                .offset(y: biaya == 0 ? 0 : -25)
                .scaleEffect(biaya == 0 ? 1 : 0.8, anchor: .leading)
            TextField("", value: $biaya, formatter: numberFormatter).foregroundColor(biaya == 0 ? .clear : .primary)
        }
        .padding().padding(.top, 5).background(.gray.opacity(0.2)).cornerRadius(10).font(.system(size: 17))
        .animation(.default)
    }
}


struct AddReportView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var reportListVM:ReportListViewModel
    
    @Binding var addView:Bool
    
    @State private var isOn = false
    @State var isFlaggingModeEnabled1 = false
    @State var isFlaggingModeEnabled2 = false
    @State var isFlaggingModeEnabled3 = false
    @State var isFlaggingModeEnabled4 = false
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false){
                VStack{
                    HStack (alignment: .center, spacing: 20){
                        Button(action: {
                            isFlaggingModeEnabled1.toggle()
                            print("SeafoodBtn")
                            if isFlaggingModeEnabled1 == true{
                                reportListVM.reportListjenisMakanan = "Seafood"
                            }
                        }, label: {
                            switch isFlaggingModeEnabled1 {
                                case true:
                                // Your image for when enabled.
                                Image("Seafood").resizable().scaledToFit().frame(height: 80).background(.red).cornerRadius(16)
                                default:
                                // Your image for when disabled.
                                Image("Seafood").resizable().scaledToFit().frame(height: 80).background(.clear).cornerRadius(16)
                            }
                        })
                        Button(action: { isFlaggingModeEnabled2.toggle()
                            print("MeatBtn")
                            if isFlaggingModeEnabled2 == true{
                                reportListVM.reportListjenisMakanan = "Meat"
                            }
                        }, label: {
                            switch isFlaggingModeEnabled2 {
                                case true:
                                // Your image for when enabled.
                                Image("Meat").resizable().scaledToFit().frame(height: 80).background(.red).cornerRadius(16)
                                default:
                                // Your image for when disabled.
                                Image("Meat").resizable().scaledToFit().frame(height: 80).background(.clear).cornerRadius(16)
                            }
                        })
                    }
                    HStack (alignment: .center, spacing: 20){
                        Button(action: { isFlaggingModeEnabled3.toggle()
                            print("PoultryBtn")
                            if isFlaggingModeEnabled3 == true{
                                reportListVM.reportListjenisMakanan = "Poultry"
                            }
                        }, label: {
                            switch isFlaggingModeEnabled3 {
                                case true:
                                // Your image for when enabled.
                                Image("Poultry").resizable().scaledToFit().frame(height: 80).background(.red).cornerRadius(16)
                                default:
                                // Your image for when disabled.
                                Image("Poultry").resizable().scaledToFit().frame(height: 80).background(.clear).cornerRadius(16)
                            }
                        })
                        Button(action: { isFlaggingModeEnabled4.toggle()
                            print("VegieBtn")
                            if isFlaggingModeEnabled4 == true{
                                reportListVM.reportListjenisMakanan = "Vegie"
                            }
                        }, label: {
                            switch isFlaggingModeEnabled4 {
                                case true:
                                // Your image for when enabled.
                                Image("Vegie").resizable().scaledToFit().frame(height: 80).background(.red).cornerRadius(16)
                                default:
                                // Your image for when disabled.
                                Image("Vegie").resizable().scaledToFit().frame(height: 80).background(.clear).cornerRadius(16)
                            }
                        })
                    }
                    Section{
                        TextInputField("Nama Makanan", text: $reportListVM.reportListNamaMakanan)
                        BiayaInputField("Biaya Makanan", biaya: $reportListVM.reportListBiayaMakanan)
                        BiayaInputField("Biaya Service", biaya: $reportListVM.reportListBiayaService)
                        BiayaInputField("Biaya Pajak", biaya: $reportListVM.reportListBiayaPajak)
                        BiayaInputField("Total Diskon", biaya: $reportListVM.reportListDiskon)
                    }.padding(.horizontal)
                    Section (footer: Text("Yuk tulis kesan kamu tentang makanan hari ini").font(.system(size: 10))){
                        TextEditor(text: $reportListVM.reportListNotes).padding().background(.gray.opacity(0.2)).cornerRadius(10).font(.system(size: 17))
                    }.padding(.horizontal)
                    Button(action: {
                        reportListVM.createReport(context: viewContext)
                        addView.toggle()
                    }, label: {
                        if reportListVM.reportListItem == nil {
                            Text("Add Transaction").bold().foregroundColor(.white).frame(width: 200, height: 45).background(.red).cornerRadius(20)
                        }
                        else{
                            Text("Edit Transaction")
                                .bold().foregroundColor(.white).frame(width: 200, height: 45).background(.red).cornerRadius(20)
                        }
                    })
//                        .tint(.yellow)
//                        .buttonStyle(.bordered)
//                        .buttonBorderShape(.roundedRectangle)
                }
            }
        }
        .navigationTitle($reportListVM.reportListItem == nil ? "Add Transaction" : "Edit Transaction")
    }

}

