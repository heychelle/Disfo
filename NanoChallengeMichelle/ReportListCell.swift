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
    
    @State private var isEdit = false
    
    var body: some View {
        HStack (spacing: 10){
            Image(reportListItem.jenisMakanan ?? "").resizable().scaledToFit().frame(height: 70).padding(.vertical, 5)
            VStack (alignment: .leading, spacing: 5){
                Text(reportListItem.namaMakanan ?? "").fontWeight(.semibold).lineLimit(2).minimumScaleFactor(0.5)
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
            })
            Button(action: {
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
                .tint(.yellow)
        }
    }
}
