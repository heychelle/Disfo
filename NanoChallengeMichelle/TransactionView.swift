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
                
                if fetchedReportList.isEmpty {
                    Image("emptyReport").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 300)
                    Text("Let's start ????").font(.system(size: 17)).multilineTextAlignment(.center).foregroundColor(Color(.secondaryLabel)).padding()
                }else{
                    List{
                        ForEach(fetchedReportList){item in
                            ReportListCell(reportListItem: item)
                        }
                    }
                }
            }.navigationTitle("Transactions")
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
