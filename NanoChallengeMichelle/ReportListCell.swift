//
//  ReportListCell.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct ReportListCell: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var reportListVM:ReportListViewModel
    @ObservedObject var reportListItem:ReportList
    
    @FetchRequest(entity: ReportList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedReportList:FetchedResults<ReportList>
    
    @State private var isEdit = false
    @State private var showDetail: Bool = false
    
    
    var body: some View {
        HStack (spacing: 20){
            Image(reportListItem.jenisMakanan ?? "").resizable().scaledToFit().frame(height: 70).padding(.vertical, 5)
            VStack (alignment: .leading, spacing: 5){
                Text(reportListItem.namaMakanan ?? "").font(.title3).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(0.5)
                Text(String(reportListItem.biayaMakanan)).font(.subheadline)
            }
        }
        .sheet(isPresented: $isEdit){
            AddReportView(addView: $isEdit)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false){
            Button(role: .destructive, action: {
                reportListVM.delete(report: reportListItem, context: viewContext)
            }, label: {
                Label("Delete",systemImage: "trash")
            }).tint(Color("Red"))
            Button(action: {
                reportListVM.reportListjenisMakanan = reportListItem.jenisMakanan ?? ""
                reportListVM.reportListNamaMakanan = reportListItem.namaMakanan ?? ""
                reportListVM.reportListBiayaMakanan = reportListItem.biayaMakanan
                reportListVM.reportListBiayaService = reportListItem.biayaService
                reportListVM.reportListBiayaPajak = reportListItem.biayaPajak
                reportListVM.reportListDiskon = reportListItem.diskon
                reportListVM.reportListNotes = reportListItem.notes ?? ""
                reportListVM.reportListItem = reportListItem
                isEdit.toggle()
            }, label: {
                Label("Edit",systemImage: "pencil")
            })
                .tint(Color("Yellow"))
        }
//        contentShape(Rectangle())
//            .onTapGesture {
//                print("Show details for user")
//                self.showDetail.toggle()
//            }.sheet(isPresented: self.$showDetail) {
////                TransactionsDetailView(reportListItem: ReportList(), reportListDetail: FetchedResults<ReportList>.Element)
//                ForEach(fetchedReportList){item in
//                    TransactionsDetailView(reportListItem: ReportList(), reportListDetail: item)
//                }
//            }
    }
}
