//
//  TransactionView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct TransactionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var reportListVM:ReportListViewModel
    
    @FetchRequest(entity: ReportList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedReportList:FetchedResults<ReportList>
    
    @State private var addView = false
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(fetchedReportList){item in
                        ReportListCell(reportListItem: item)
                    }
                }
            }
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
