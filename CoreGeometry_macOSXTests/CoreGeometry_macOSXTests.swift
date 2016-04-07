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
            XCTAssert((360 - i)° === (-i°))
            XCTAssert((360 + i)° === i°)
        }
        XCTAssertFalse((60 + 10000)° == 60°)
        XCTAssert((60 + 36000)° === 60°)
    }
}
