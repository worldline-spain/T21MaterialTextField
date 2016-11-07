//
//  ViewController.swift
//  T21MaterialTextField
//
//  Created by Eloi Guzmán Cerón on 04/11/16.
//  Copyright © 2016 Worldline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet open weak var textFieldA : T21MaterialTextField?
    @IBOutlet open weak var textFieldB : T21MaterialTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textFieldA?.feedbackStatus = .Error
        textFieldA?.hintText = "Hint text A"
        textFieldA?.errorHintText = "Error hint text A"
        textFieldA?.placeholder = "Placeholer text A"
        
        textFieldB?.feedbackStatus = .None
        textFieldB?.hintText = "Hint text A"
        textFieldB?.errorHintText = "Error hint text A"
        textFieldB?.placeholder = "Placeholer text A"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

