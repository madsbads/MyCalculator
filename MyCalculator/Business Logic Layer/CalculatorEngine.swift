import Foundation

struct CalculatorEngine {
    
    enum OperandSide {
        case leftHandSide
        case rightHandSide
    }
    
    // MARK: - Math Equation
    private var mathEquation = MathEq(lhs: .zero)
    private var operandSide = OperandSide.leftHandSide
    
    // MARK: - Display
    
    var displayText = ""
    
    // MARK: - Extra Functions
    
    mutating func clearPressed() {
        
    }
    
    mutating func negatePressed() {
        
    }
    
    mutating func percentagePressed() {
        
    }
    
    // MARK: - Operations
    
    mutating func addPressed() {
        mathEquation.oper = .add
        operandSide = .rightHandSide
    }
    
    mutating func minusPressed() {
        mathEquation.oper = .subtract
        operandSide = .rightHandSide
    }
    
    mutating func multiplyPressed() {
        mathEquation.oper = .multiply
        operandSide = .rightHandSide
    }
    
    mutating func dividePressed() {
        mathEquation.oper = .divide
        operandSide = .rightHandSide
    }
    
    mutating func equalsPressed() {
        mathEquation.execute()
        displayText = mathEquation.result?.formatted() ?? "Error"
        operandSide = OperandSide.leftHandSide
    }
    
    // MARK: - Number Input
    
    mutating func decimalPressed() {
        
    }
    
    mutating func numberPressed(_ number: Int) {
        let value = Decimal(number)
        displayText = value.formatted()
        switch operandSide {
        case .leftHandSide:
            mathEquation.lhs = value
        case .rightHandSide:
            mathEquation.rhs = value
        }
    }
}
