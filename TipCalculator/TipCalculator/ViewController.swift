//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ben Whitley on 6/15/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var textFieldSubtotal: UITextField!

    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var labelTipValue: UILabel!
    @IBOutlet weak var labelTotalValue: UILabel!

    @IBOutlet weak var sliderTip: UISlider!

    // MARK: - Properties

    let calculator: Calculator = Calculator()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldSubtotal.becomeFirstResponder()
        sliderTip.isEnabled = false
        setupToolbar()
    }

    // MARK: - Setup

    func setupToolbar() {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()

        let spaceFlexible = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil)

        let buttonDone = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneAction))

        toolbar.setItems([spaceFlexible, buttonDone],
                         animated: true)

        textFieldSubtotal.inputAccessoryView = toolbar
    }

    // MARK: - Actions

    @IBAction func sliderDrag(_ sender: UISlider) {
        labelTip.text = "Tip(\(Int(sender.value))%):"
        updateLabels()
    }

    // MARK: - Helper Functions

    func doneAction() {
        textFieldSubtotal.resignFirstResponder()

        if textFieldSubtotal.text?.characters.count == 0 {
            calculator.subtotalFromTextField = "0.00"
            sliderTip.isEnabled = false
        } else {
            if let subtotalText = textFieldSubtotal.text {
                calculator.subtotalFromTextField = subtotalText
            }
            sliderTip.isEnabled = true
        }
        updateLabels()
    }

    func updateLabels() {
        calculator.tipPercentageFromSlider = Int(sliderTip.value)
        textFieldSubtotal.text = calculator.subtotalAsCurrency

        labelTipValue.text = calculator.tipAsCurrency
        labelTotalValue.text = calculator.totalAsCurrency
    }
}

// MARK: - ViewController TextField Delegate

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        sliderTip.isEnabled = false
    }
}

