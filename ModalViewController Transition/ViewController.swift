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
        
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(ViewController.handlePan(_:)))
        view.addGestureRecognizer(panGesture)
        
        
    }
    
    var modalVC: ModalViewController!
    
    func handlePan(panGesture: UIPanGestureRecognizer) {
        if modalVC == nil {
            modalVC = ModalViewController()
        }
        
        let translationX =  panGesture.translationInView(view).x
        let progress = -(translationX / view.frame.width * 2)
        
        print(progress)
        
        switch panGesture.state {
        case .Began:
            print("Began")
            modalVC.transitionDelegate.interactive = true
            presentViewController(modalVC, animated: true, completion: nil)
            break
        case .Changed:
            modalVC.transitionDelegate.interactionController.updateInteractiveTransition(progress>1 ? 1 : progress)
            break
        case .Cancelled, .Ended:
            print("Cancelled")
            modalVC.transitionDelegate.interactionController.completionSpeed = 0.99
            if progress > 0.5 {
                modalVC.transitionDelegate.interactionController.finishInteractiveTransition()
            }
            else {
                modalVC.transitionDelegate.interactionController.cancelInteractiveTransition()
            }
            modalVC.transitionDelegate.interactive = false
            modalVC = nil
            break
        default:
            break
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//        presentViewController(ModalViewController(), animated: true) { 
//            print("PresentViewController")
//        }
//        
//    }

}

