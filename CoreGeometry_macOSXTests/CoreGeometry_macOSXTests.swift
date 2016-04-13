//
//  CoreGeometry_macOSXTests.swift
//  CoreGeometry_macOSXTests
//
//  Created by Pierre TACCHI on 04/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import XCTest

class CoreGeometry_macOSXTests: XCTestCase {
    func testDegree() {
        XCTAssertEqual(CGAngleZero, 0°)
        XCTAssertEqual(CGAngle.PI_4, 45°)
        XCTAssertEqual(CGAngle.PI_2 , 90°)
        XCTAssertEqual(CGAngle.PI, 180°)
        XCTAssertEqual(CGAngle.PI2, 360°)
        for i in 0...360 {
            XCTAssert((360 - i)° =~ (-i°))
            XCTAssert((360 + i)° =~ i°)
        }
        XCTAssertFalse((60 + 10000)° == 60°)
        XCTAssert((60 + 36000)° =~ 60°)
    }
    
    func testNormalizedAngle() {
        let center = CGPoint(x: 20, y: 20)
        let p0 = CGPoint(x: 30, y: 20)
        let p45 = CGPoint(x: 30, y: 30)
        let p90 = CGPoint(x: 20, y: 30)
        let p135 = CGPoint(x: 10, y: 30)
        let p180 = CGPoint(x: 10, y: 20)
        let p225 = CGPoint(x: 10, y: 10)
        let p270 = CGPoint(x: 20, y: 10)
        let p315 = CGPoint(x: 30, y: 10)
        
        XCTAssert(getNormalizedAngle(center: center, point: p0) =~ 0°)
        XCTAssert(getNormalizedAngle(center: center, point: p45) =~ 45°)
        XCTAssert(getNormalizedAngle(center: center, point: p90) =~ 90°)
        XCTAssert(getNormalizedAngle(center: center, point: p135) =~ 135°)
        XCTAssert(getNormalizedAngle(center: center, point: p180) =~ 180°)
        XCTAssert(getNormalizedAngle(center: center, point: p225) =~ 225°)
        XCTAssert(getNormalizedAngle(center: center, point: p270) =~ 270°)
        XCTAssert(getNormalizedAngle(center: center, point: p315) =~ 315°)
    }
}
