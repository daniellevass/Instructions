//
//  InterfaceController.swift
//  InstructionsWatch Extension
//
//  Created by danielle vass on 24/09/2018.
//  Copyright © 2018 danielle vass. All rights reserved.
//

import WatchKit
import Foundation


class InstructionsInterfaceController: WKInterfaceController {

    @IBOutlet weak var lblTitle: WKInterfaceLabel!
    @IBOutlet weak var lblInstructions: WKInterfaceLabel!
    
    @IBOutlet weak var btnPrevious: WKInterfaceButton!
    @IBOutlet weak var btnNext: WKInterfaceButton!
    @IBOutlet weak var divider: WKInterfaceSeparator!
    
    var index: Int = 0
    
    var instructions : Instruction? {
        
        didSet{
            guard let instructions = instructions else {return}
            self.instructions = instructions
            
            divider.setColor(instructions.colour)
            
            index = 0
            btnPrevious.setEnabled(false)
            renderItem()
        }
        
    }
    
    
    func renderItem(){

        
        lblTitle.setText("Row \(index + 1) of \(instructions?.instructions.count ?? 0)")
        lblInstructions.setText( self.instructions?.instructions[index] )

    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        //instructions = Instruction.init()
        
        if let instructions = context as? Instruction {
            self.instructions = instructions
        }
    }

    @IBAction func longTapPressed(_ sender: Any) {
        NSLog("long press")
    }
    
    @IBAction func btnNextPressed() {
        var total = self.instructions?.instructions.count  ?? 0
        total = total - 1
        if (index < total ) {
            index = index + 1
            WKInterfaceDevice.current().play(.start)
            renderItem()
            
            if (index == total){
                btnNext.setEnabled(false)
            }
        }
        
        btnPrevious.setEnabled(true)
    }
    @IBAction func btnPreviousPressed() {
        
        if index > 0 {
            index = index - 1
            renderItem()
            WKInterfaceDevice.current().play(.failure)
            if index == 0 {
                
                btnPrevious.setEnabled(false)
            }
        }
        btnNext.setEnabled(true)
    }
}
