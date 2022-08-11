//
//  CalculatorView.swift
//  Calculator
//
//  Created by Tristan Aly on 01/07/2022.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var buttons: [[CaseButton]] = [
        [.clear, .plusMinus, .pourcent, .div],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal],
    ]
    @State var operation : Operation = .none
    @State var runningNumber = 0
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
                            ForEach(row, id: \.self) { calcul in
                                Button( action: {
                                self.Calculator(button: calcul)
                                }, label: {
                                    Text(calcul.rawValue)
                                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                                        .foregroundColor(.white)
                                        .frame(width: self.FrameButton(buttonWidth: calcul),
                                               height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                        .background(calcul.backgroundbutton)
                                        .cornerRadius(self.FrameButton(buttonWidth: calcul))
                                })
                            }
                        } //: HStack
                    } //: VStack
                } // ForEach
            } //: VStack
            .frame(width: 350)
            .padding()
        } //: ZStack
    }
    // Operation
    func Calculator(button: CaseButton) {
        switch button {
        case .equal, .plus, .minus, .multiply, .div:
            if button == .plus {
                self.operation = .plus
                self.runningNumber = Int(self.num) ?? 0
                
            } else if button == .minus  {
                self.operation = .minus
                self.runningNumber = Int(self.num) ?? 0
                
            } else if button == .multiply  {
                self.operation = .multiply
                self.runningNumber = Int(self.num) ?? 0
                
            } else if button == .div  {
                self.operation = .div
                self.runningNumber = Int(self.num) ?? 0
                
            } else if button == .equal  {
                let runningValue = self.runningNumber
                let currentValue = Int(self.num) ?? 0
                
                switch self.operation {
                case .plus: self.num = "\(runningValue + currentValue)"
                case .minus: self.num = "\(runningValue - currentValue)"
                case .multiply: self.num = "\(runningValue * currentValue)"
                case .div: self.num = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal {
                self.num = "0"
            }
        case .clear:
            self.num = "0"
        case .dot, .plusMinus, .pourcent:
            break
        default:
            let number = button.rawValue
            if self.num == "0" {
                num = number
            } else {
                self.num = "\(self.num)\(number)"
            }
        }
    }
    
    func FrameButton(buttonWidth: CaseButton) -> CGFloat {
        if buttonWidth == .zero {
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

// MARK: Enum

enum Operation {
    case plus, minus, multiply, div, none
}

//Buttons
enum CaseButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
    case plusMinus = "+/-"
    case pourcent = "%"
    case div = "÷"
    case multiply = "x"
    case minus = "-"
    case equal = "="
    case plus = "+"
    case clear = "AC"
    
    var backgroundbutton: Color {
        switch self {
        case .clear, .plusMinus, .pourcent:
            return Color.gray
        case .equal, .plus, .minus, .multiply, .div:
            return Color.orange
        default:
            return .gray.opacity(0.5)
        }
    }
}

