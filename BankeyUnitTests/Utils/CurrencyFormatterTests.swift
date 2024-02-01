//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Elif İlay KANDEMİR on 12.01.2024.
//

import XCTest

@testable import Bankey

class Test: XCTestCase{
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
        
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarFormatter() throws {
        let result = formatter.dollarsFormatted(965746)
        XCTAssertEqual(result,"$965,746.00")
    }
    
    func testZeroDollarFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result,"$0.00")
    }
    
    func testDollarFormattedWithCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")
    }
}

