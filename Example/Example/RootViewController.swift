//
//  RootViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import LFSideViewController

class RootViewController: LFSideViewController, LFSideViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController")
        self.rightViewController = storyboard.instantiateViewControllerWithIdentifier("RightViewController")
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController")
        
        self.sideViewController()!.delegate = self
    }
    
    func willPresentViewController(viewController: UIViewController?) {
        print("willPresentViewController \(viewController)")
    }
    
    func didPresentViewController(viewController: UIViewController?) {
        print("didPresentViewController \(viewController)")
    }
    
    func willHideViewController(viewController: UIViewController?) {
        print("willHideViewController \(viewController)")
    }
    
    func didHideViewController(viewController: UIViewController?) {
        print("didHideViewController \(viewController)")
    }
}
