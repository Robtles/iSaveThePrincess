//
//  STPOverlayedModalViewController.swift
//  iSaveThePrincess
//
//  Created by Robin on 19/08/2017.
//  Copyright © 2017 Rob. All rights reserved.
//

import UIKit

// Base view controller for overlay modals appearing on the center of the screen.
class STPOverlayedModalViewController: UIViewController {
    
    // The overlay black view under the alert view
    @IBOutlet weak var overlayView: UIView?
    // The alert view with content
    @IBOutlet weak var alertView: UIView?
    
    var isDismissingByBottom: Bool = false
    
    // MARK: - Application lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.alertView?.setCornerRadius(radius: 8.0)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension STPOverlayedModalViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController,
                                    presenting: UIViewController,
                                    source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return STPPresentOverlayedModalViewAnimationController()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return STPDismissOverlayedModalViewAnimationController()
    }
}

// MARK: - UIViewControllerAnimatedTransitioning
private final class STPPresentOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toViewController: STPOverlayedModalViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! STPOverlayedModalViewController
        let duration = self.transitionDuration(using: transitionContext)
        
        let containerView = transitionContext.containerView
        toViewController.view.frame = containerView.frame
        containerView.addSubview(toViewController.view)
        
        toViewController.overlayView?.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            
            toViewController.overlayView?.alpha = 0.6
        })
        
        let finishFrame = toViewController.alertView?.frame
        var startingFrame = finishFrame
        startingFrame?.origin.y = -((finishFrame?.height)!)
        toViewController.alertView?.frame = startingFrame!
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1.0,
                       options: .layoutSubviews,
                       animations: {
                        
            toViewController.alertView?.frame = finishFrame!
                        
        }, completion: { result in
            
            transitionContext.completeTransition(result)
        })
    }
}

private final class STPDismissOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController: STPOverlayedModalViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! STPOverlayedModalViewController
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            
            fromViewController.overlayView?.alpha = 0.0
        })
        
        var finishFrame = fromViewController.alertView?.frame
        finishFrame?.origin.y = fromViewController.isDismissingByBottom ? fromViewController.view.frame.size.height : -(finishFrame?.height)!
        
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: .layoutSubviews,
                       animations: {
                        
            fromViewController.alertView?.frame = finishFrame!
                        
        }, completion: { result in
            
            transitionContext.completeTransition(true)
        })
    }
}
