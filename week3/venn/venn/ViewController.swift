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
    
    @IBAction func leftTapped(_ sender: UIButton){
        self.vennDiagram.weight = VennWeight.left
    }
    
    @IBAction func balancedTapped(_ sender: UIButton) {
        self.vennDiagram.weight = VennWeight.balanced
    }
    
    
    @IBAction func rightTapped(_ sender: UIButton) {
        self.vennDiagram.weight = VennWeight.right
    }


}

