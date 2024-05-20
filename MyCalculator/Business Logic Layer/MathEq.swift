//
//  Math.swift
//  MyCalculator
//
//  Created by Maddie Nevans on 5/18/24.
//

import Foundation

struct MathEq {
    
    enum OperationType {
        case add
        case subtract
        case multiply
        case divide
    }
    
    var lhs: Decimal
    var rhs: Decimal?
    var oper: OperationType?
    var result: Decimal?
    
    mutating func execute() {
        
        guard
            let rhs = self.rhs,
            let oper = self.oper else {
            return
        }
        
        switch oper {
        case .add:
            result = lhs+rhs
        case .divide:
            result = lhs/rhs
        case .multiply:
            result = lhs*rhs
        case .subtract:
            result = lhs-rhs
        }
    
    }
}
