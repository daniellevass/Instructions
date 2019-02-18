//
//  CrochetItemsInterfaceController.swift
//  Instructions
//
//  Created by danielle vass on 24/09/2018.
//  Copyright © 2018 danielle vass. All rights reserved.
//

import WatchKit
import Foundation


class CrochetItemsInterfaceController: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    
    var instructions : [Instruction] = []


    func loadJson(fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                parseJSON(data: data)
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    func parseJSON(data: Data){
        do {
            let decoder = JSONDecoder()
            self.instructions = try decoder.decode([Instruction].self, from: data)
        } catch let error {
            print(error as? Any ?? "ERROR")
        }
        
    }

 
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        loadJson(fileName: "Instructions")
        
        table.setNumberOfRows(instructions.count, withRowType: "CrochetItemRow")
        
        for index in 0..<table.numberOfRows {
            guard let controller = table.rowController(at: index) as? CrochetItemRow else { continue }
            controller.instruction = instructions[index]
        }
        
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let instruction = instructions[rowIndex]
        presentController(withName: "Instruction", context: instruction)
    }


}
