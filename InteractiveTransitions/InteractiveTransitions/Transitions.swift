//
//  Transitions.swift
//  InteractiveTransitions
//
//  Created by Ben Whitley on 7/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

/// Used in navigation controller delegate and photo detail view controller.
var interactiveTransition: UIPercentDrivenInteractiveTransition?

class ShowTransition: NSObject,
                      UIViewControllerAnimatedTransitioning {

    func animateTransition
        (using transitionContext: UIViewControllerContextTransitioning) {

        let context = transitionContext

        // create view, imageViews and view controllers
        guard
            let sourceVC = context.viewController(forKey: .from),
            let destVC = context.viewController(forKey: .to),
            let dest = destVC.view,
            let gSourceVC = sourceVC as? PhotoCollectionViewController,
            let gDestVC = destVC as? PhotoDetailViewController,
            let sourceImageView = gSourceVC.getImageForShow(transition: self),
            let destImageView = gDestVC.getImageForShow(transition: self)
            else { return }

        let container = context.containerView
        let transitionSourceImageView = UIImageView(image: sourceImageView.image)
        transitionSourceImageView.frame = container.convert(sourceImageView.frame,
                                                            from: sourceImageView.superview)

        // add views for animation
        container.addSubview(dest)
        container.addSubview(transitionSourceImageView)

        // initial values before animation
        dest.alpha = 0.0
        sourceImageView.isHidden = true
        destImageView.isHidden = true
        transitionSourceImageView.contentMode = .scaleAspectFit

        let showAnimator = UIViewPropertyAnimator(duration: transitionDuration(using: context),
                                                  dampingRatio: 0.9) {

            dest.alpha = 1.0
            transitionSourceImageView.frame = container.convert(destImageView.frame,
                                                                to: destImageView.superview)

        }

        showAnimator.startAnimation()
        showAnimator.addCompletion { _ in

            transitionSourceImageView.removeFromSuperview()
            sourceImageView.isHidden = false
            destImageView.isHidden = false
            context.completeTransition(true)
        }

    }

    func transitionDuration
        (using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {

        return 0.35
    }
}

class DismissTransition: NSObject,
                         UIViewControllerAnimatedTransitioning {
    
    
    func animateTransition
        (using transitionContext: UIViewControllerContextTransitioning) {

        let context = transitionContext

        // create view, imageViews and view controllers
        guard
            let sourceVC = context.viewController(forKey: .from),
            let destVC = context.viewController(forKey: .to),
            let dest = destVC.view,
            let gSourceVC = sourceVC as? PhotoDetailViewController,
            let gDestVC = destVC as? PhotoCollectionViewController,
            let sourceImageView = gSourceVC.getImageForDismiss(transition: self),
            let destImageView = gDestVC.getImageForDismiss(transition: self)
            else { return }

        let container = context.containerView
        let transitionSourceImageView = UIImageView(image: sourceImageView.image)
        transitionSourceImageView.frame = container.convert(sourceImageView.frame,
                                                            from: sourceImageView.superview)

        // add views for animation
        container.addSubview(dest)
        container.addSubview(transitionSourceImageView)

        // initial values before animation
        dest.alpha = 0.0
        sourceImageView.isHidden = true
        destImageView.isHidden = true
        transitionSourceImageView.contentMode = .scaleAspectFit

        let dismissAnimator = UIViewPropertyAnimator(duration: transitionDuration(using: context),
                                                     dampingRatio: 0.9) {

            dest.alpha = 1.0
            transitionSourceImageView.frame = container.convert(destImageView.frame,
                                                                from: destImageView.superview)
        }

        dismissAnimator.startAnimation()
        dismissAnimator.addCompletion { _ in

            transitionSourceImageView.removeFromSuperview()
            sourceImageView.isHidden = false
            destImageView.isHidden = false
            context.completeTransition(!context.transitionWasCancelled)
        }
    }

    func transitionDuration
        (using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.35
    }
}

