//
//  CalculatorView.swift
//  Calculator
//
//  Created by Tristan Aly on 01/07/2022.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var buttons: [[CaseButton]] = [
        [.ac, .plusMinus, .pourcent, .div],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal],
    ]
    
    @State var num = "0"
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            
            VStack(alignment: .trailing){
                
                Spacer()
                
                Text(num)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .padding()
                
                ForEach(buttons, id: \.self) { row in
                    VStack{
                        HStack{
                            ForEach(row, id: \.self) { button in
                                Button {
                                    num.append(button.title)
                                } label: {
                                    Text(button.title)
                                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                                        .foregroundColor(.white)
                                        .frame(width: self.FrameButton(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                        .background(button.backgroundbutton)
                                        .cornerRadius(self.FrameButton(button: button))
                                }
                            }
                        } //: HStack
                    } //: VStack
                } // ForEach
            } //: VStack
            .frame(width: 350)
            .padding()
        } //: ZStack
    }
    func FrameButton(button: CaseButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

enum CaseButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, dot
    case ac, plusMinus, pourcent
    case equal, plus, minus, multiply, div
    
    var backgroundbutton: Color {
        switch self {
        case .ac, .plusMinus, .pourcent:
            return Color.gray
        case .equal, .plus, .minus, .multiply, .div:
            return Color.orange
        default:
            return .gray.opacity(0.5)
        }
    }
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
        case .plusMinus: return "+/-"
        case .pourcent: return "%"
        case .div: return "÷"
        case .multiply: return "x"
        case .minus: return "-"
        case .equal: return "="
        case .plus: return "+"
        default:
            return "AC"
        }
    } 
}
