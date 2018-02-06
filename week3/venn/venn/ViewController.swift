//
//  ViewController.swift
//  venn
//
//  Created by Dominic Lynn on 23/1/18.
//  Copyright © 2018 Dominic Lynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vennDiagram: VennDiagram!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftClick(sender: UIButton){
        self.vennDiagram.weight = VennWeight.Left
    }
    
    @IBAction func balanceClick(sender: UIButton) {
        self.vennDiagram.weight = VennWeight.Balanced
    }
    
    
    @IBAction func rightClick(sender: UIButton) {
        self.vennDiagram.weight = VennWeight.Right
    }


}

