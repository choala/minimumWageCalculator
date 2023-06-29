//
//  ContentView.swift
//  minimumWageCalculator
//
//  Created by 용가리듬타 on 2023/06/29.
//

import SwiftUI

struct ContentView: View {
    let minimumWage: Int = 9620
    @State var taxRatio: Double = 00
    @State var dayWorkTime: Double = 0 // 일일 근무시간
    @State var weekWorkCount: Double = 1 // 일주 근무일수
    var weeklyAllowance: Double = 0
    var isWeeklyAllowance: Bool { // 주휴수당 해당 여부
        get {
            if dayWorkTime * weekWorkCount >= 15 {
                return true
            } else {
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                HStack {
                    Text("최저 시급")
                    
                    Spacer()
                    
                    Text("\(minimumWage)원")
                }
                
                HStack {
                    Text("일일 근무시간")
                    Slider(
                        value: $dayWorkTime,
                        in: 0...24,
                        step: 0.5
                    ) {
                        Text("일일 근무시간")
                    }
                    Text("\(String(format: "%.1f", dayWorkTime))시간")
                }
                
                HStack {
                    Text("일주 근무일수")
                    Slider(
                        value: $weekWorkCount,
                        in: 1...7,
                        step: 1
                    ) {
                        Text("일주 근무일수")
                    }
                    Text("\(Int(weekWorkCount))일")
                }
                
                HStack {
                    Text("세금")
                    
                    Spacer()
                    
                    Button {
                        taxRatio = 9.4
                    } label: {
                        Text("9.4%")
                            .frame(width: 100, height: 40)
                            .background(.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .cornerRadius(5)
                    }
                    
                    
                    Button {
                        taxRatio = 3.3
                    } label: {
                        Text("3.3%")
                            .frame(width: 100, height: 40)
                            .background(.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()
            
            calcButton(minimumWage: minimumWage, salary: 0, dayWorkTime: dayWorkTime,
                       weekWorkCount: weekWorkCount, taxRatio: taxRatio, taxFee: 0,
                       weeklyAllowance: weeklyAllowance, isWeeklyAllowance: isWeeklyAllowance)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
