//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = 0;
    var inputs: [String] = []
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: String, no2: String) -> String {
        let no1Int = Int(no1) ?? 0
        let no2Int = Int(no2) ?? 0
        let added = no1Int + no2Int
        
        return String(added)
    }
    
    func subtract(no1: String, no2: String) -> String{
        let no1Int = Int(no1) ?? 0
        let no2Int = Int(no2) ?? 0
        let sub = no1Int - no2Int
        return String(sub)
    }
    func multiply(no1: String, no2: String) -> String{
        let no1Int = Int(no1) ?? 0
        let no2Int = Int(no2) ?? 0
        let multi = no1Int * no2Int
        return String(multi)
    }
    func divide(no1: String, no2: String) -> String{
        let no1Int = Int(no1) ?? 0
        let no2Int = Int(no2) ?? 0
        let divi = no1Int / no2Int
        return String(divi)
    }
    
    func modulo(no1: String, no2: String) -> String{
        let no1Int = Int(no1) ?? 0
        let no2Int = Int(no2) ?? 0
        let modu = no1Int % no2Int
        return String(modu)
    }
    
    
    func addArguments(arguments: [String]){
        for i in stride(from: 0, to:args.count, by: 1){
            print(args[i])
            inputs.append(args[i])
        }
    }
    
    
    func findFirstOperation(){
        for i in stride(from: 0, to:args.count, by:1){
            
            if args[i] == "x"{
                let leftNum = FindLeftPosition(position: i-1)
                let rightNum = FindRightPosition(position: i+1)
                
                //find closest left and right first
                args[i] = multiply(no1: args[leftNum], no2: args[rightNum])
                
                args[leftNum] = "nil"
                args[rightNum] = "nil"
                
            }
            
            if args[i] == "/" {
                let leftNum = FindLeftPosition(position: i-1)
                let rightNum = FindRightPosition(position: i+1)
                args[i] = divide(no1: args[leftNum], no2: args[rightNum])
                args[leftNum] = "nil"
                args[rightNum] = "nil"
            }
            
            if args[i] == "%"{
                let leftNum = FindLeftPosition(position: i-1)
                let rightNum = FindRightPosition(position: i+1)
                args[i] = modulo(no1: args[leftNum], no2: args[rightNum])
                args[leftNum] = "nil"
                args[rightNum] = "nil"
            }
        }
    }
    
    func findSecondOperation(){
        for i in stride(from: 0, to: args.count, by:1){
            
            
            if args[i] == "+"{
                
                
                let leftNum = FindLeftPosition(position: i-1)
                let rightNum = FindRightPosition(position: i+1)
                
                
                args[i] = add(no1: args[leftNum], no2: args[rightNum])
                
                args[leftNum] = "nil"
                args[rightNum] = "nil"
            }
            
            if args[i] == "-"{
                let leftNum = FindLeftPosition(position: i-1)
                let rightNum = FindRightPosition(position: i+1)
                
                args[i] = subtract(no1: args[leftNum], no2: args[rightNum])
                
                args[leftNum] = "nil"
                args[rightNum] = "nil"
            }
            
        }
    }
    
    
    
    
    
    func FindLeftPosition(position: Int) -> Int{
        if args[position] != "nil"{
            
            return position
        }
        else{
        
            return FindLeftPosition(position: position - 1)
        }
        
        
    }
    func FindRightPosition(position: Int) -> Int{
        if args[position] != "nil"{
            return position
        }
        else{
            return FindRightPosition(position: position + 1)
        }
    }
    
    
    
    
    func checkRelevantArgs(){
        for i in inputs{
            
            if i == "x"{
                print("Multiply")
            }
            else if i == "/"{
                print("Divide!")
            }
            else if i == "%"{
                print("Modulo!")
            }
            else if i == "+"{
                print("Plus!")
            }
            else if i == "-"{
                print("Minus!")
            }
            
            else{
                print("Number!")
            }
        }
    }
    
    func finalise(){
        args = args.filter(){$0 != "nil"}
        
    }
    
    
    
    func initialInputCheck() -> Bool{
        for i in stride(from: 0, to: args.count, by: 1){
            if i % 2 == 0 {
                if !checkInt(string: args[i]){
                   return false
                }
            }
            else{
                if !checkSign(string: args[i]){
                    return false
                }
            }
        }
        
        return true
    }
    func checkSign(string: String)-> Bool{
        if string != "x" || string != "+" || string != "-" || string != "/" || string != "%"{
            return false
        }
        return true
    }
    
    func checkInt(string: String) -> Bool{
        //modulo check if =0 int
        if string.contains("+") || string.contains("-"){
            return false
        }
        return Int(string) != nil
    }
    
    
    func printOutput(){
        for i in args{
            print(i, terminator: " ")
        }
    }
    
}
