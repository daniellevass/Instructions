//
//  Instruction.swift
//  Instructions
//
//  Created by danielle vass on 24/09/2018.
//  Copyright © 2018 danielle vass. All rights reserved.
//

import WatchKit
import Foundation

struct Instruction : Decodable{
    
    let title: String
    let instructions: [String]
    let r: Float
    let g: Float
    let b: Float
    
    

   
    
//    init(instructions : [String], colour: UIColor, title: String){
//        self.instructions = instructions
//        self.colour = colour
//        self.title = title
//    }
    
    var colour: UIColor {
        return UIColor.init(displayP3Red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
    }
    
//    convenience init(){
//        let instructions = [
//            "one", "two", "three", "four"
//        ]
//
//        self.init(instructions: instructions, colour: UIColor.red, title: "title")
//
//    }
    
//    convenience init(dictionary: [String: AnyObject]) {
//        let title:String = dictionary["title"]! as! String
//        let red:Float =  dictionary["r"] as! Float
//        let green:Float = dictionary["g"] as! Float
//        let blue:Float = dictionary["b"] as! Float
//
////        let instructions:[String] = [dictionary["instructions"]!]
//
//        let instructions:[String] = []
//
//        let colour: UIColor = UIColor.init(red: CGFloat(red),
//                                           green: CGFloat(green),
//                                           blue: CGFloat(blue),
//                                           alpha: 1.0)
//
//
//        self.init(instructions: instructions, colour: colour, title: title)
//    }
//
}
