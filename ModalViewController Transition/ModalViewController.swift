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
    
    deinit {
        print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.grayColor()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ModalViewController.dismiss))
        view.addGestureRecognizer(tap)
        
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(ModalViewController.handlePan(_:)))
        view.addGestureRecognizer(panGesture)
        
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true) { 
            print("DismissViewController")
        }
    }
    
    func handlePan(panGesture: UIPanGestureRecognizer) {
        let translationX =  panGesture.translationInView(view).x
        let progress = translationX / view.frame.width * 2
        
//        print(progress)
        
        switch panGesture.state {
        case .Began:
            print("Began")
            transitionDelegate.interactive = true
            dismiss()
            break
        case .Changed:
            transitionDelegate.interactionController.updateInteractiveTransition(progress>1 ? 1 : progress)
            break
        case .Cancelled, .Ended:
            print("Cancelled")
            transitionDelegate.interactionController.completionSpeed = 0.99
            if progress > 0.5 {
                transitionDelegate.interactionController.finishInteractiveTransition()
            }
            else {
                transitionDelegate.interactionController.cancelInteractiveTransition()
            }
            transitionDelegate.interactive = false
            break
        default:
            break
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
