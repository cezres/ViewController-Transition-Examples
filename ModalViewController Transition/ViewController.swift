//
//  ViewController.swift
//  ModalViewController Transition
//
//  Created by 翟泉 on 16/6/7.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        presentViewController(ModalViewController(), animated: true) { 
            print("PresentViewController")
        }
        
    }

}

