//
//  ViewController.swift
//  MyCalculator
//
//  Created by Maddie Nevans on 5/18/24.
//

import UIKit

class CalcViewController: UIViewController {
    
    // MARK: - IBOutlets
    // Digits
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var buttonDecimal: UIButton!
    
    // Addtnl Functions
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonPosNeg: UIButton!
    @IBOutlet weak var buttonPercent: UIButton!
    
    // Operators
    @IBOutlet weak var buttonDiv: UIButton!
    @IBOutlet weak var buttonMult: UIButton!
    @IBOutlet weak var buttonSubt: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    
    // Display
    @IBOutlet weak var lcdDisplay: UIView!
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: - Theme
    var currentTheme: CalculatorTheme {
        return CalculatorTheme(backgroundColor: "#000000", displayTextColor: "#FFFFFF", digitColor: "#8D6B94", digitTitleColor: "#FFFFFF", operationColor: "#000000", operationTitleColor: "#FFFFFF", addtnlFunctionColor: "#000000", addtnlFunctionTitleColor: "#FFFFFF")
    }
    
    // MARK: - Calculator Engine
    private var calculatorEngine = CalculatorEngine()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
    }
    
    //MARK: - Decorating
    private func decorateView() {
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        
        lcdDisplay.backgroundColor = .clear
        displayLabel.textColor = UIColor(hex: currentTheme.displayTextColor)
        
        decorateButtons()
    }
    
    private func decorateButtons() {
        decorateDigits(button0, true)
        decorateDigits(button1)
        decorateDigits(button2)
        decorateDigits(button3)
        decorateDigits(button4)
        decorateDigits(button5)
        decorateDigits(button6)
        decorateDigits(button7)
        decorateDigits(button8)
        decorateDigits(button9)
        decorateDigits(buttonDecimal)

        decorateAddtnlFunction(buttonClear)
        decorateAddtnlFunction(buttonPosNeg)
        decorateAddtnlFunction(buttonPercent)

        decorateOperations(buttonDiv)
        decorateOperations(buttonMult)
        decorateOperations(buttonSubt)
        decorateOperations(buttonAdd)
        decorateOperations(buttonEqual)
    }
    
    private func decorateButton(_ button: UIButton, _ slicedImage: Bool = false) {
        let image = slicedImage ? UIImage(named: "Oval") : UIImage(named: "Circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
    }

    private func decorateAddtnlFunction(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.addtnlFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.addtnlFunctionTitleColor), for: .normal)
    }
    
    private func decorateOperations(_ button: UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
    }
    
    private func decorateDigits(_ button: UIButton, _ slicedImage: Bool = false) {
        decorateButton(button, slicedImage)
        
        button.tintColor = UIColor(hex: currentTheme.digitColor)
        button.setTitleColor(UIColor(hex: currentTheme.digitTitleColor), for: .normal)
        
    }
    
    // MARK: - IBActions
    
    @IBAction private func clearPressed() {
        calculatorEngine.clearPressed()
        refreshDisplay()
    }
    
    @IBAction private func negatePressed() {
        calculatorEngine.negatePressed()
        refreshDisplay()
    }
    
    @IBAction private func percentagePressed() {
        calculatorEngine.percentagePressed()
        refreshDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        calculatorEngine.addPressed()
        refreshDisplay()
    }
    
    @IBAction private func minusPressed() {
        calculatorEngine.minusPressed()
        refreshDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        calculatorEngine.multiplyPressed()
        refreshDisplay()
    }
    
    @IBAction private func dividePressed() {
        calculatorEngine.dividePressed()
        refreshDisplay()
    }
    
    @IBAction private func equalsPressed() {
        calculatorEngine.equalsPressed()
        refreshDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        calculatorEngine.decimalPressed()
        refreshDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        let number = sender.tag
        calculatorEngine.numberPressed(number)
        refreshDisplay()
    }
    
    // MARK: - Refresh Display
    private func refreshDisplay() {
        displayLabel.text = calculatorEngine.displayText
    }
}

