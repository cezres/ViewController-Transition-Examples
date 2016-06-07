//
//  ModalViewController.swift
//  ViewController Transition Examples
//
//  Created by 翟泉 on 16/6/7.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    let transitionDelegate = TransitioningDelegate()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .Custom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.orangeColor()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ModalViewController.dismiss))
        view.addGestureRecognizer(tap)
        
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true) { 
            print("DismissViewController")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
