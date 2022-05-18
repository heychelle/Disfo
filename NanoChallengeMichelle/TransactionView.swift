//
//  TransactionView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct TransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var reportListVM: ReportListViewModel
    @Environment(\.presentationMode) var presentationMode

    @FetchRequest(entity: ReportList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedReportList: FetchedResults<ReportList>

    @State private var addView = false
    @State private var selected: ReportList?
    @State private var showDetail: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if fetchedReportList.isEmpty {
                    Image("emptyReport").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250)
                    Text("No reports added").fontWeight(.semibold).font(.system(size: 32)).multilineTextAlignment(.center).padding()
                } else {
                    List {
                        ForEach(fetchedReportList) { item in
                            ReportListCell(reportListItem: item)
                                .onTapGesture {
                                    self.selected = item
                                    print("Show details for user \($selected)")
                                }.sheet(item: self.$selected) { item in
//                                    Text(item.namaMakanan ?? "")
                                    NavigationView {
                                        ScrollView(.vertical, showsIndicators: false) {
                                            VStack(spacing: 20) {
                                                Image(item.jenisMakanan ?? "").resizable().scaledToFit().frame(height: 150)
                                                Text(item.namaMakanan ?? "").font(.title2).fontWeight(.semibold).lineLimit(2).multilineTextAlignment(.center).padding(.horizontal)
                                                HStack(spacing: 20) {
                                                    Spacer()
                                                    VStack(spacing: 5) {
                                                        Text(String(item.biayaMakanan)).font(.body).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                                                        Text("Biaya Makanan").font(.system(size: 10)).multilineTextAlignment(.center)
                                                        Text(String(item.biayaPajak)).font(.body).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                                                        Text("Biaya Pajak").font(.system(size: 10)).multilineTextAlignment(.center)
                                                    }
                                                    Spacer()
                                                    VStack(spacing: 5) {
                                                        Text(String(item.diskon)).font(.body).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                                                        Text("Total Diskon").font(.system(size: 10)).multilineTextAlignment(.center)
                                                        Text(String(item.biayaService)).font(.body).fontWeight(.semibold).lineLimit(1).multilineTextAlignment(.center).padding(.horizontal)
                                                        Text("Biaya Service").font(.system(size: 10)).multilineTextAlignment(.center)
                                                    }
                                                    Spacer()
                                                }
                                                Text(item.notes ?? "").font(.body).fontWeight(.regular).lineLimit(15).multilineTextAlignment(.leading).padding(.horizontal)
                                                Button(action: {
                                                    reportListVM.delete(report: item, context: viewContext)
                                                    self.selected = nil
                                                }, label: {
                                                    Text("Delete").bold().foregroundColor(.white).frame(width: 200, height: 45).background(Color("Red")).cornerRadius(16)
                                                })
                                            }
                                        }.navigationTitle("Transactions Detail").padding()
                                    }
                                }
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
