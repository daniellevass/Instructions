//
//  ViewController.swift
//  Instructions
//
//  Created by danielle vass on 24/09/2018.
//  Copyright © 2018 danielle vass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var instructions = [Instruction]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadJson(fileName:"Instructions")
        
    }

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
        
        print(self.instructions)
    }

    @IBAction func buttonPressed(_ sender: Any) {
    }
}

