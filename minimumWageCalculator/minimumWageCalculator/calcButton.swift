//
//  calcButton.swift
//  minimumWageCalculator
//
//  Created by 용가리듬타 on 2023/06/29.
//

import SwiftUI

struct calcButton: View {
    var minimumWage: Int
    @State var salary: Double
    var dayWorkTime: Double
    var weekWorkCount: Double
    var taxRatio: Double
    @State var taxFee: Double
    @State var weeklyAllowance: Double = 0
    var isWeeklyAllowance: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Text("예상 주휴수당")
                
                Spacer()
                
                Text("(+) \(Int(weeklyAllowance))원")
            }
            .padding(5)
            
            HStack {
                Text("예상 월급")
                
                Spacer()
                
                Text("(+) \(Int(salary - weeklyAllowance))원")
            }
            .padding(5)
            
            HStack {
                Text("적용 세금(\(String(format: "%.1f", taxRatio))%)")
                
                Spacer()
                
                Text("(-) \(Int(taxFee))원")
            }
            .padding(5)
            
            Spacer()
            
            Group {
                Text("이번 달 최종 예상 월급은")
                HStack {
                    Text("\(Int(salary))")
                        .fontWeight(.bold)
                    Text("원 입니다.")
                }
                
            }
            .font(.title2)
            .padding(2)
            
            Spacer()
            
            Button {
                calcWage()
            } label: {
                Text("계산하기")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .background(.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
    }
    
    func calcWage() {
        salary = Double(minimumWage) * dayWorkTime * weekWorkCount * 4.34
        
        if isWeeklyAllowance {
            weeklyAllowance = (dayWorkTime * weekWorkCount / 40) * 8 * Double(minimumWage) * 4.34
            salary += weeklyAllowance
        }
        
        taxFee = salary * (taxRatio / 100)
        salary -= taxFee
    }
}
