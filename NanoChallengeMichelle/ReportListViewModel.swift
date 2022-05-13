//
//  ReportListViewModel.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//


import Foundation
import Combine
import CoreData

class ReportListViewModel:ObservableObject{
    
    @Published var reportListjenisMakanan: String = ""
    @Published var reportListNamaMakanan = ""
    @Published var reportListBiayaMakanan : Int32 = 0
    @Published var reportListBiayaService : Int32 = 0
    @Published var reportListBiayaPajak : Int32 = 0
    @Published var reportListDiskon : Int32 = 0
    @Published var reportListNotes = ""
    @Published var reportListItem:ReportList!
    
    func createReport(context:NSManagedObjectContext){
        if reportListItem == nil {
            let report = ReportList(context: context)
            report.id = UUID()
            report.jenisMakanan = reportListjenisMakanan
            report.namaMakanan = reportListNamaMakanan
            report.biayaMakanan = Int32(reportListBiayaMakanan)
            report.biayaService = Int32(reportListBiayaService)
            report.biayaPajak = Int32(reportListBiayaPajak)
            report.diskon = Int32(reportListDiskon)
            report.notes = reportListNotes
            report.date = Date()
        }
        else{
            reportListItem.jenisMakanan = reportListjenisMakanan
            reportListItem.namaMakanan = reportListNamaMakanan
            reportListItem.biayaMakanan = Int32(reportListBiayaMakanan)
            reportListItem.biayaService = Int32(reportListBiayaService)
            reportListItem.biayaPajak = Int32(reportListBiayaPajak)
            reportListItem.diskon = Int32(reportListDiskon)
            reportListItem.notes = reportListNotes
        }
        
        save(context: context)
        reportListjenisMakanan = ""
        reportListNamaMakanan = ""
        reportListBiayaMakanan = 0
        reportListBiayaService = 0
        reportListBiayaPajak = 0
        reportListDiskon = 0
        reportListNotes = ""
    }
    
    func editList(report:ReportList){
        reportListItem = report
    }
    
    func delete(report:ReportList, context:NSManagedObjectContext){
        context.delete(report)
        save(context: context)
    }
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
    
}
