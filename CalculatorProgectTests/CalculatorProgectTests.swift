//
//  CalculatorProgectTests.swift
//  CalculatorProgectTests
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import XCTest
@testable import CalculatorProgect

class CalculatorProgectTests: XCTestCase {
    
    var brain: CalculatorBrain? = nil
    
    override func setUp() {
        super.setUp()
        brain = CalculatorBrain()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        brain = nil
    }
    

//MARK: Sofiia tests:
    //test 1
    func test5Plus4Equal9() {
        brain?.digit(value: 5)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 4)
        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)

        XCTAssert(result == 9)
    }
    //test 2
    func test5Plus4Plus2Equal11() {
        brain?.digit(value: 5)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 4)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 2)
        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == 11)
    }
   //test 3
    func testNegative3Plus5Equal2(){
        brain?.digit(value: 3)
        brain?.unary(operation: .PlusMinus)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == 2)
    }
    
   //test 4
    func test3PlusNegative5EqualNegative2(){
        brain?.digit(value: 3)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == -2)
    }
    //test 5
    func testNegative3PlusNegative5EqualNegative8(){
        brain?.digit(value: 3)
        brain?.unary(operation: .PlusMinus)

        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == -8)
    }
    
    //test 6
    func testNegative4Plus6PlusNegative5EqualNegative3() {
        brain?.digit(value: 4)
        brain?.unary(operation: .PlusMinus)

        brain?.binary(operation: .Plus)
        brain?.digit(value: 6)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == -3)
    }
    //test 7
    func testFractionPlusFraction() {
        brain?.digit(value: 0.1)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 0.2)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.3)
    }
    
    //test 8
    func testNegativeFractionPlus8() {
        brain?.digit(value: 0.5)
        brain?.unary(operation: .PlusMinus)

        brain?.binary(operation: .Plus)
        brain?.digit(value: 8)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 7.5)
    }
    
    //test 9
    func testFractionPlusFractionPlusNegativeFraction() {
        brain?.digit(value: 0.5)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 0.2)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 0.6)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.1)
    }
    
    //test 10
    
    func test6Plus4EqualEqual14() {
        brain?.digit(value: 6)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 4)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        brain?.utility(operation: .Equal)

        XCTAssert(result == 14)
    }
    //test 11
    func testNegative5plusNegative2EqualEqual() {
        brain?.digit(value: 5)
        brain?.unary(operation: .PlusMinus)

        brain?.binary(operation: .Plus)
        brain?.digit(value: 2)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == -9)
    }
    //test 12
    func testFractionPlusNegative5EqualEqual() {
        brain?.digit(value: 0.2)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        brain?.unary(operation: .PlusMinus)

        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == -9.8)
    }
    
    //test 13
    func test9SqrtPlus5Equals8() {
        brain?.digit(value: 9)
        brain?.unary(operation: .Sqrt)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 5)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == 8)
    }
    
    //test 14
    func test9SqrtPlus9SqrtEquals6() {
        brain?.digit(value: 9)
        brain?.unary(operation: .Sqrt)
        brain?.binary(operation: .Plus)
        brain?.digit(value: 9)
        brain?.unary(operation: .Sqrt)

        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        
        XCTAssert(result == 6)
    }
    func testFractionSqrt(){
        brain?.digit(value: 0.25)
        brain?.unary(operation: .Sqrt)
        var result: Double? = nil
        brain?.result = {(value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.5)
    }
    
//MARK: Sasha Dudash tests
    
    func test10DivBy2() {
        brain?.digit(value: 10)
        brain?.binary(operation: .Div)
        brain?.digit(value: 2)
        var result: Double? = nil
        brain?.result = {(value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 5)
    }
    
    func testNegative20DivByNegative5(){
        
        brain?.digit(value: -20)
        brain?.binary(operation: .Div)
        brain?.digit(value: -5)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 4)
    }
    
    func testNegative6DivBy3(){
        brain?.digit(value: -6)
        brain?.binary(operation: .Div)
        brain?.digit(value: 3)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -2)
    }
    
    func test0DivBy5(){
        brain?.digit(value: 0)
        brain?.binary(operation: .Div)
        brain?.digit(value: 5)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0)
    }
    
    func test8DivByFraction(){
        brain?.digit(value: 8)
        brain?.binary(operation: .Div)
        brain?.digit(value: 0.5)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 16)
    }
    
    func test5DivBy0() {
        let infinity = Double.infinity
        brain?.digit(value: 5)
        brain?.binary(operation: .Div)
        brain?.digit(value: 0)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == infinity)
    }
    
    func testFractionDivByFraction() {
        brain?.digit(value: 0.1)
        brain?.binary(operation: .Div)
        brain?.digit(value: 0.2)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.5)
    }
    
    func testIntDivByIntLessThanIntMax() {
        brain?.digit(value: 8)
        brain?.binary(operation: .Div)
        brain?.digit(value: 4)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result! < Double(Int.max))
    }
    
    func testIntDivByIntMoreThanIntMin() {
        brain?.digit(value: 20)
        brain?.binary(operation: .Div)
        brain?.digit(value: 4)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result! > Double(Int.min))
    }
    
    func testNegative10DivByFraction() {
        brain?.digit(value: -10)
        brain?.binary(operation: .Div)
        brain?.digit(value: 0.2)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -50)
    }
    
    func testFractionDivBy5() {
        brain?.digit(value: 0.1)
        brain?.binary(operation: .Div)
        brain?.digit(value: 5)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.02)
    }
    
    func testFractionDivByNegative2() {
        brain?.digit(value: 0.8)
        brain?.binary(operation: .Div)
        brain?.digit(value: -2)
        var result: Double? = nil
        brain?.result = { (value,error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -0.4)
    }

    //MARK: Sasha Evdokymov
    
    //1) 7 - 4 = 3
    func test7Min4Equal3() {
        brain?.digit(value: 7)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 4)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 3)
    }
    //2) 15-3-2=10
    func test15Min3Min2Equal10() {
        brain?.digit(value: 15)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 3)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 2)
        var result: Double? = nil

        brain?.result = {(value, error) in
        result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 10)
    }
    //3) 2-3.5=-1.5
    func test2Min3dot5Equalminus1dot5() {
        brain?.digit(value: 2)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 3.5)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -1.5)
    }
    //4) 5-11=-6
    func test5Min11Equalminus6() {
        brain?.digit(value: 5)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 11)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -6)
    }
    //5) 3.56-1.75=1.81
    func test3dot55Min1dot75Equal1dot8() {
        brain?.digit(value: 3.56)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 1.75)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 1.81)
    }
    //6) 9-0=9
    func test9Min0Equal9() {
        brain?.digit(value: 9)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 0)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 9)
    }
    //7) -10-0.5=-10.5
    func testminus10Min0dot5Equalminus10dot5() {
        brain?.digit(value: -10)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 0.5)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -10.5)
    }
    //8 -5-(-3)=-2
    func testminus5Minminus3Equalminus2() {
        brain?.digit(value: -5)
        brain?.binary(operation: .Minus)
        brain?.digit(value: -3)
        var result: Double? = nil

        brain?.result = {(value, error) in
            result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -2)
    }
    

    
}
