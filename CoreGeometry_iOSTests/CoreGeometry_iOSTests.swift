//
//  CoreGeometry_iOSTests.swift
//  CoreGeometry_iOSTests
//
//  Created by Pierre TACCHI on 07/04/16.
//  Copyright © 2016 Pyrolyse. All rights reserved.
//

import XCTest

class CoreGeometry_iOSTests: XCTestCase {
    func testCGPoint() {
        let t: AnyObject = 22°
        XCTAssert(t is CGAngle)
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
        
        XCTAssert(center.getVector(p0).direction =~ 0°)
        XCTAssert(center.getVector(p45).direction =~ 45°)
        XCTAssert(center.getVector(p90).direction =~ 90°)
        XCTAssert(center.getVector(p135).direction =~ 135°)
        XCTAssert(center.getVector(p180).direction =~ 180°)
        XCTAssert(center.getVector(p225).direction =~ 225°)
        XCTAssert(center.getVector(p270).direction =~ 270°)
        XCTAssert(center.getVector(p315).direction =~ 315°)
    }
}
