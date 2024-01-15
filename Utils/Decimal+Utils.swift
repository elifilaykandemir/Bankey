//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Elif İlay
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
    
}
