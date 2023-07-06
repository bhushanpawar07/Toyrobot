//
//  ToyRobot.swift
//  Toyrobot
//
//  Created by Shanaya  on 06/07/23.
//

import Foundation

enum Direction {
    case north, south, east, west
}

class ToyRobot {
    var xPosition: Int
    var yPosition: Int
    var direction: Direction
    
    init() {
        xPosition = 0
        yPosition = 0
        direction = .north
    }
    
    func place(x: Int, y: Int, direction: Direction) {
        if isValidPosition(x: x, y: y) {
            xPosition = x
            yPosition = y
            self.direction = direction
        }
    }
    
    func move() {
        var newX = xPosition
        var newY = yPosition
        
        switch direction {
        case .north:
            newY += 1
        case .south:
            newY -= 1
        case .east:
            newX += 1
        case .west:
            newX -= 1
        }
        
        if isValidPosition(x: newX, y: newY) {
            xPosition = newX
            yPosition = newY
        }
    }
    
    func rotateLeft() {
        switch direction {
        case .north:
            direction = .west
        case .south:
            direction = .east
        case .east:
            direction = .north
        case .west:
            direction = .south
        }
    }
    
    func rotateRight() {
        switch direction {
        case .north:
            direction = .east
        case .south:
            direction = .west
        case .east:
            direction = .south
        case .west:
            direction = .north
        }
    }
    
     func isValidPosition(x: Int, y: Int) -> Bool {
        return x >= 0 && x < 5 && y >= 0 && y < 5
    }
}
