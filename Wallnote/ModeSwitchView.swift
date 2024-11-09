//
//  ModeSwitchView.swift
//  Wallnote
//
//  Created by Daniel Mittag on 29/3/2567 BE.
//

import SwiftUI

struct ModeSwitchView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
//    @AppStorage("currencySymbolfirst") private var currencySymbolfirst = false

//    @EnvironmentObject var expenseData: ExpenseData
    
    var body: some View {
        VStack {
            Text("Mode.")
                .fontWeight(.bold)
            + Text(" Choose your preferred mode.")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        VStack {
            Picker("Mode", selection: $isDarkMode) {
                    Text("Light")
                        .tag(false)
                    Text("Dark")
                        .tag(true)
            }
            .pickerStyle(.segmented)
        }
        .padding()
        Spacer()
    }
}

//func getLocalCurrencySymbol() -> String {
//    let currencySymbol = Locale.current.currencySymbol ?? "$" // Default to "$" if symbol not found
//    return currencySymbol
//}

struct ModeSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        ModeSwitchView()
    }
}
