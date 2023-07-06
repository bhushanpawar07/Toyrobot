//
//  ToyrobotTests.swift
//  ToyrobotTests
//
//  Created by Bhushan  on 06/07/23.
//

import XCTest
@testable import Toyrobot

final class ToyrobotTests: XCTestCase {
    var robot: ToyRobot!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    override func setUp() {
        super.setUp()
        robot = ToyRobot()
    }
    
    func testPlace() {
        robot.place(x: 1, y: 2, direction: .north)
        XCTAssertEqual(robot.xPosition, 1)
        XCTAssertEqual(robot.yPosition, 2)
        XCTAssertEqual(robot.direction, .north)
        
        // Invalid positions should be ignored
        robot.place(x: -1, y: 3, direction: .west)
        XCTAssertEqual(robot.xPosition, 1)
        XCTAssertEqual(robot.yPosition, 2)
        XCTAssertEqual(robot.direction, .north)
    }
    
    func testMove() {
        robot.place(x: 0, y: 0, direction: .north)
        robot.move()
        XCTAssertEqual(robot.xPosition, 0)
        XCTAssertEqual(robot.yPosition, 1)
        
        robot.place(x: 1, y: 1, direction: .south)
        robot.move()
        XCTAssertEqual(robot.xPosition, 1)
        XCTAssertEqual(robot.yPosition, 0)
        
        // Moving to an invalid position should be ignored
        robot.place(x: 4, y: 4, direction:.south)
        robot.move()
        XCTAssertEqual(robot.xPosition, 4)
        XCTAssertEqual(robot.yPosition, 4)
    }
    
    func testRotateLeft() {
        robot.place(x: 0, y: 0, direction: .north)
        robot.rotateLeft()
        XCTAssertEqual(robot.direction, .west)
        
        robot.place(x: 0, y: 0, direction: .south)
        robot.rotateLeft()
        XCTAssertEqual(robot.direction, .east)
    }
    
    func testRotateRight() {
        robot.place(x: 0, y: 0, direction: .north)
        robot.rotateRight()
        XCTAssertEqual(robot.direction, .east)
        
        robot.place(x: 0, y: 0, direction: .west)
        robot.rotateRight()
        XCTAssertEqual(robot.direction, .north)
    }
    
    func testIsValidPosition() {
        XCTAssertTrue(robot.isValidPosition(x: 0, y: 0))
        XCTAssertTrue(robot.isValidPosition(x: 4, y: 4))
        XCTAssertFalse(robot.isValidPosition(x: -1, y: 2))
        XCTAssertFalse(robot.isValidPosition(x: 2, y: 5))
    }

}
