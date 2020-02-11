//
//  Student.swift
//  InheritanceAndProtocolsExample
//
//  Created by MacStudent on 2020-02-10.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

class Student : Person
{
    lazy var marks = [String : Double]()
    
    init(id: Int, name: String, gender: Gender, marks:[String:Double])
    {
        super.init(id: id, name: name, gender: gender)
        self.marks = marks
    }
    
    subscript(Code:String) -> Double
    {
        get
        {
            self.marks[Code] ?? 0.0
        }
        set(newValue)
        {
            self.marks.updateValue(newValue, forKey: Code)
        }
    }
    
    
    subscript(Code:Int) -> Any
    {
        get
        {
            if Code == 0
            {
                return self.id
            }
            else if Code == 1
            {
                return self.name
            }
            return self.gender
        }

    }
    
    var total : Double
    {
        return self.calculateTotal()
    }
    var per : Double
    {
        return calculatePercentage()
    }
    var result : String
    {
        return "PASS"
    }
    
    func setMarks(code:String, mark:Double)
    {
        self.marks.updateValue(mark, forKey: code)
    }
    
    private func calculateTotal() -> Double
    {
        var t = 0.0
        for m in self.marks
        {
            t = t + m.value
        }
        return t
    }
    
    private func calculatePercentage() -> Double
    {
        return self.total / Double(self.marks.count)
    }
    
    
    override func display()
       {
            super.display()
            for m in self.marks
            {
                print(m.key, ":" , m.value)
            }
        
            print("Total : \(self.total)")
            print("Percentage : \(self.per)")
            print("Result : \(self.result)")
       }
       
}

