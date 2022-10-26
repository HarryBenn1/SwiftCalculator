//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
// Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
// Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// Calculate the result

// add inputs to calculator
//check valid inputs
//do * / % and replace empty with null
//do + - and replace empty with null
//find final num



calculator.findFirstOperation()
calculator.findSecondOperation()

calculator.finalise()
calculator.printOutput()


