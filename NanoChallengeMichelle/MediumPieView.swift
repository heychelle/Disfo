//
//  MediumPieView.swift
//  NanoChallengeMichelle
//
//  Created by Michelle Alexandra on 13/05/22.
//

import SwiftUI

struct MediumPieView: View {
    
    public let values: [Double]
    
       public var colors: [Color]
       
       public var backgroundColor: Color
       
       var slices: [PieSliceData] {
           let sum = values.reduce(0, +)
           var endDeg: Double = 0
           var tempSlices: [PieSliceData] = []
           
           for (i, value) in values.enumerated() {
               let degrees: Double = value * 360 / sum
               tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees),
              text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
               endDeg += degrees
           }
           return tempSlices
       }
       
       var body: some View {
           GeometryReader { geometry in
               ZStack{
                   ForEach(0..<self.values.count){ i in
                       PieSliceView(pieSliceData: self.slices[i])
                   }
                   .frame(width: geometry.size.width, height: geometry.size.width)
               }
               .background(self.backgroundColor)
               .foregroundColor(Color.white)
           }
       }
   }

struct MediumPieView_Previews: PreviewProvider {
    static var previews: some View {
        MediumPieView(values: [30, 20, 50], colors: [Color.blue, Color.green, Color.orange], backgroundColor: Color(red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0))
    }
}
