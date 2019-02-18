//
//  CrochetItemRow.swift
//  Instructions
//
//  Created by danielle vass on 24/09/2018.
//  Copyright © 2018 danielle vass. All rights reserved.
//

import WatchKit

class CrochetItemRow: NSObject {

    @IBOutlet weak var lblTitle: WKInterfaceLabel!
    @IBOutlet weak var divider: WKInterfaceSeparator!
    
    var instruction: Instruction? {
        didSet {
            guard let instruction = instruction else { return }
            
            lblTitle.setText(instruction.title)
            divider.setColor(instruction.colour)
        }
    }
        
}
