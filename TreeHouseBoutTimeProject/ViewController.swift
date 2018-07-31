//
//  ViewController.swift
//  TreeHouseBoutTimeProject
//
//  Created by Joey Devlin on 7/30/18.
//  Copyright © 2018 Joey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = "Space History Game"
        infoLabel.text = "A Treehouse Project 3 by Joey D"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Labels/Buttons
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
}

