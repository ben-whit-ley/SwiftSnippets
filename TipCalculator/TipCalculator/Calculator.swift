//
//  Calculator.swift
//  TipCalculator
//
//  Created by Ben Whitley on 6/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import Foundation

class Calculator {

    var subtotalFromTextField = "0.00"
    var tipPercentageFromSlider = 15

    // MARK: - Calculated Properties

    var subtotalValue: NSDecimalNumber {
        let decimal = NSDecimalNumber(string: subtotalFromTextField)
        return decimal.floatValue.isNaN ? 0 as NSDecimalNumber : decimal
    }

    var tipPercentage: NSDecimalNumber {
        return NSDecimalNumber(value: Double(tipPercentageFromSlider)/100)
    }

    var tipValue: NSDecimalNumber {
        return subtotalValue.multiplying(by: tipPercentage)
    }

    var totalValue: NSDecimalNumber {
        return subtotalValue.adding(tipValue)
    }

    // MARK: - Convert to Currency

    let formatter = NumberFormatter()

    var subtotalAsCurrency: String? {
        formatter.numberStyle = .currency

        let subtotalAsNumber = subtotalValue as NSNumber
        if let subtotalAsString = formatter.string(from: subtotalAsNumber) {
            return subtotalAsString
        }

        return nil
    }

    var tipAsCurrency: String? {
        formatter.numberStyle = .currency

        let tipAsNumber = tipValue as NSNumber
        if let tipAsString = formatter.string(from: tipAsNumber) {
            return tipAsString
        }

        return nil
    }

    var totalAsCurrency: String? {
        formatter.numberStyle = .currency

        let totalAsNumber = totalValue as NSNumber
        if let totalAsString = formatter.string(from: totalAsNumber) {
            return totalAsString
        }

        return nil
    }
}
