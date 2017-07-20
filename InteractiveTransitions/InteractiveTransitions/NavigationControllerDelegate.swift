//
//  NavigationControllerDelegate.swift
//  InteractiveTransitions
//
//  Created by Ben Whitley on 7/17/17.
//  Copyright © 2017 Ben Whitley. All rights reserved.
//

import UIKit

protocol ImageViewsForTransition {

    func getImageForShow
        (transition: ShowTransition) -> UIImageView?

    func getImageForDismiss
        (transition: DismissTransition) -> UIImageView?
}

class NavigationControllerDelegate: NSObject,
                                    UINavigationControllerDelegate {

    func navigationController
        (_ navigationController: UINavigationController,
         animationControllerFor operation: UINavigationControllerOperation,
         from fromVC: UIViewController,
         to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        if fromVC.isKind(of: PhotoCollectionViewController.self) {
            return ShowTransition()
        } else if fromVC.isKind(of: PhotoDetailViewController.self) {
            return DismissTransition()
        } else {
            return nil
        }
    }

    func navigationController
        (_ navigationController: UINavigationController,
         interactionControllerFor
        animationController: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {

            if animationController.isKind(of: DismissTransition.self) {
                return interactiveTransition
            }

            return nil
    }
}
