//
//  ContentView.swift
//  Calculator
//
//  Created by li on 2025/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CalculatorButton(
                title: "1", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground", action: {
                    print("Button 1")
                }
                
            )
            CalculatorButton(
                title: "2", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground", action: {
                    print("Button 2")
                }
                
            )
            CalculatorButton(
                title: "3", size: CGSize(width: 88, height: 88), backgroundColorName: "digitBackground", action: {
                    print("Button 3")
                }
                
            )
            CalculatorButton(
                title: "+", size: CGSize(width: 88, height: 88), backgroundColorName: "operatorBackground", action: {
                    print("Button +")
                }
                
            )
        }
        
        
            
    }
}

struct CalculatorButton: View {
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        })
    }
}

#Preview {
    ContentView()
}
