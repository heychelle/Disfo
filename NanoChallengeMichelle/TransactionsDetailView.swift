//
//  TransactionsDetailView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 15/05/22.
//

import SwiftUI

struct TransactionsDetailView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var reportListVM:ReportListViewModel
    @ObservedObject var reportListItem:ReportList
    
    var reportListDetail: ReportList?
    
    var body: some View {
        ScrollView(.vertical)  {
            VStack (spacing: 20){
                Image(reportListDetail?.jenisMakanan ?? "").resizable().scaledToFit().frame(height: 150)
                Text(reportListDetail?.namaMakanan ?? "").font(.title2).fontWeight(.semibold).lineLimit(2).multilineTextAlignment(.center).padding(.horizontal)
                HStack (spacing: 20){
                    Spacer()
                    VStack (spacing: 5){
                        Text(String(reportListDetail!.biayaMakanan)).font(.subheadline).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                        Text("Biaya Makanan").font(.system(size: 10)).multilineTextAlignment(.center)
                        Text(String(reportListDetail!.biayaPajak)).font(.subheadline).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                        Text("Biaya Pajak").font(.system(size: 10)).multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack (spacing: 5){
                        Text(String(reportListDetail!.diskon)).font(.subheadline).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                        Text("Total Diskon").font(.system(size: 10)).multilineTextAlignment(.center)
                        Text(String(reportListDetail!.biayaService)).font(.subheadline).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                        Text("Biaya Service").font(.system(size: 10)).multilineTextAlignment(.center)
                    }
                    Spacer()
                }
                Text(reportListDetail?.notes ?? "").font(.system(size: 17)).fontWeight(.regular).lineLimit(15).multilineTextAlignment(.center).padding(.horizontal)
//                Button(action: {
//                    reportListVM.delete(report: reportListItem, context: viewContext)
//                }, label: {
//                        Text("Delete").bold().foregroundColor(.white).frame(width: 200, height: 45).background(.red).cornerRadius(20)
//                })
            }.navigationTitle("Transaction Detail")
        }
    }
}
