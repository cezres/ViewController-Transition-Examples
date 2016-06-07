//
//  AnimatedTransitioning.swift
//  ViewController Transition Examples
//
//  Created by 翟泉 on 16/6/7.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

import UIKit

class AnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()
        
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else{
            return
        }
        
        
        if toVC.isBeingPresented() {
            
            containerView?.addSubview(toVC.view)
            
//            toVC.view.alpha = 0
            toVC.view.transform = CGAffineTransformTranslate(toVC.view.transform, toVC.view.frame.size.width, 0)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                //
//                toVC.view.alpha = 1
                toVC.view.transform = CGAffineTransformTranslate(toVC.view.transform, -toVC.view.frame.size.width, 0)
            }, completion: { (ff) in
                //
                let isCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCancelled)
            })
            
        }
        else if fromVC.isBeingDismissed() {
            
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                //
                fromVC.view.alpha = 0
            }, completion: { (ff) in
                //
                let isCancelled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCancelled)
            })
            
        }
        
        
    }
    
}
