//
//  ViewController.swift
//  Toyrobot
//
//  Created by Bhushan  on 06/07/23.
//

import UIKit

class ViewController: UIViewController {
    let robot = ToyRobot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        robot.place(x: 1, y: 2, direction: .north)
        robot.move()
        robot.rotateLeft()
        robot.move()
        robot.rotateRight()
        robot.move()
        
        print("Robot position: (\(robot.xPosition), \(robot.yPosition))")
        print("Robot direction: \(robot.direction)")
    }
}
